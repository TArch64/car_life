part of 'car_model.dart';

enum EventMileageRecurrence {
  single,
  recurring
}

enum EventMileageRecurrenceEnds {
  never,
  after
}

@Serializable
class EventMileageModel {
  EventMileageRecurrence recurrence;
  int value;
  int recurrenceInterval;
  EventMileageRecurrenceEnds recurrenceEnds;
  int recurrenceCount;

  EventMileageModel({
    this.recurrence = EventMileageRecurrence.single,
    this.value = 0,
    this.recurrenceInterval = 500,
    this.recurrenceCount = 1,
    this.recurrenceEnds = EventMileageRecurrenceEnds.never
  });

  static EventMileageModel fromJson(Map<String, dynamic> json) {
    return _$EventMileageModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EventMileageModelToJson(this);
  }

  @JsonIgnore()
  bool get isRecurring => recurrence == EventMileageRecurrence.recurring;
  set isRecurring(bool value) => recurrence = value ? EventMileageRecurrence.recurring : EventMileageRecurrence.single;

  @JsonIgnore()
  bool get isEnds => recurrenceEnds == EventMileageRecurrenceEnds.after;
}
