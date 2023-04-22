import 'package:flutter/cupertino.dart';

import 'events_group_data.dart';

class EventsGroup extends StatelessWidget {
  final EventsGroupData groupData;

  const EventsGroup({super.key, required this.groupData});

  @override
  Widget build(BuildContext context) {
    return Text("${groupData.fromMileage}");
  }
}
