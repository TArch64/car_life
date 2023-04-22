import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'event_model.g.dart';

const Serializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
);

@Collection<EventModel>('events', prefix: 'Event')
@Serializable
class EventModel {
  @Id()
  final String id;
  String name;
  int mileage;
  String carId;

  EventModel({
    required this.id,
    required this.name,
    required this.mileage,
    required this.carId,
  });

  factory EventModel.empty() {
    return EventModel(id: "", mileage: 0, name: "", carId: "");
  }
}