import 'package:car_life/models/car_model.dart';

class EventsGroupData {
  static const step = 500;
  final int index;

  EventsGroupData(this.index);

  factory EventsGroupData.fromMileage(int mileage) {
    return EventsGroupData((mileage / step).round());
  }

  int get fromMileage => index * step;
  int get toMileage => (index + 1) * step;

  bool eventInGroup(EventModel event) {
    final mileage = event.mileage!;

    if (!mileage.isRecurring) {
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
      if (mileage.isEnds && recurringIteration >= mileage.recurrenceCount) {
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
