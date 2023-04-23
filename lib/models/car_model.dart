import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'car_model.g.dart';

const Serializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
);

@Collection<CarModel>('cars', prefix: 'Car')
@Serializable
class CarModel {
  @Id()
  final String id;
  String userId;
  String name;
  int mileage;

  CarModel({
    this.id = '',
    this.name = '',
    this.mileage = 0,
    this.userId = ''
  });
}