import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'car_model.g.dart';

const Serializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
);

@Collection<CarModel>('cars')
@Serializable
class CarModel {
  @Id()
  final String id;
  final String name;
  final int mileage;
  final String userId;

  CarModel({
    required this.id,
    required this.name,
    required this.mileage,
    required this.userId
  });
}