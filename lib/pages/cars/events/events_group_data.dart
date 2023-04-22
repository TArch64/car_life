class EventsGroupData {
  static const step = 500;
  final int index;

  EventsGroupData(this.index);

  factory EventsGroupData.fromMileage(int mileage) {
    return EventsGroupData((mileage / step).round());
  }

  int get fromMileage => index * step;
  int get toMileage => (index + 1) * step;
}
