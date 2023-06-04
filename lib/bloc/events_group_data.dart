import 'package:car_life/models/Event.dart';
import 'package:car_life/models/EventMileageRecurrence.dart';
import 'package:car_life/models/EventMileageRecurrenceEnds.dart';

class EventsGroupData {
  static const step = 500;
  final int index;

  EventsGroupData(this.index);

  factory EventsGroupData.fromMileage(int mileage) {
    return EventsGroupData((mileage / step).round());
  }

  int get fromMileage => index * step;
  int get toMileage => (index + 1) * step;

  List<Event> selectEvents(List<Event> events) {
    return events.where((event) => isEventInGroup(event)).toList();
  }

  bool isEventInGroup(Event event) {
    final mileage = event.mileage;
    final isRecurring = mileage.recurrence == EventMileageRecurrence.RECURRING;
    if (!isRecurring) {
      return inGroup(mileage.value);
    }
    int recurringValue = mileage.value;
    int recurringIteration = 1;
    while(true) {
      if (inGroup(recurringValue)) {
        return true;
      }
      if (recurringValue > toMileage) {
        return false;
      }
      final isEnds = mileage.recurrenceEnds == EventMileageRecurrenceEnds.AFTER_COUNT;
      if (isEnds && recurringIteration >= mileage.recurrenceCount) {
        return false;
      }
      recurringIteration++;
      recurringValue += mileage.recurrenceInterval;
    }
  }

  bool inGroup(int mileage) {
    return mileage >= fromMileage && mileage < toMileage;
  }

  static String formatMileage(int raw) {
    final mileage = raw / 1000;
    final formatted = mileage.toStringAsFixed(mileage.truncateToDouble() == mileage ? 0 : 1);
    return "${formatted}k";
  }
}
