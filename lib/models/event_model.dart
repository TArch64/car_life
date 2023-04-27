part of 'car_model.dart';

@Serializable
class EventModel {
  @Id()
  final String id;
  String name;
  EventMileageModel? mileage;

  EventModel({
    this.id = '',
    this.name = '',
    this.mileage
  });

  EventModel copy() {
    return EventModel(
        id: id,
        name: name,
        mileage: mileage
    );
  }
}