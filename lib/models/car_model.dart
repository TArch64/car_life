import 'package:car_life/core/serializable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'car_model.g.dart';

@Collection<CarModel>('cars', prefix: 'Car')
@Collection<EventModel>('cars/*/events', name: 'events', prefix: 'Event')
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

@Serializable
class EventModel {
  @Id()
  final String id;
  String name;
  int mileage;

  EventModel({
    this.id = '',
    this.name = '',
    this.mileage = 0,
  });
}