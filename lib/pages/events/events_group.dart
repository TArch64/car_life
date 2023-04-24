import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/models/car_model.dart';

import 'events_group_data.dart';
import 'events_group_cell.dart';

class EventsGroup extends StatelessWidget {
  final EventsGroupData groupData;

  EventsGroup({super.key, required this.groupData});

  @override
  Widget build(BuildContext context) {
    final carRef = context.inject<CarDocumentReference>();
    return FirestoreBuilder(
      ref: carRef.events.whereMileage(
        isGreaterThanOrEqualTo: groupData.fromMileage,
        isLessThan: groupData.toMileage
      ),
      builder: (_, snapshot, __) {
        final events = snapshot.data?.docs.map((event) => event.data).toList() ?? [];
        return Row(children: _eventWidgets(events) + [_mileageWidget(context)]);
      },
    );
  }

  Widget _mileageWidget(BuildContext context) {
    final mileage = groupData.fromMileage / 1000;
    final formatted = mileage.toStringAsFixed(mileage.truncateToDouble() == mileage ? 0 : 1);

    return EventsGroupCell(
      size: 1,
      highlight: true,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("${formatted}k")],
      ),
    );
  }

  List<Widget> _eventWidgets(List<EventModel> events) {
    if (events.isEmpty) {
      return [
        EventsGroupCell.placeholder(size: 2, highlight: false)
      ];
    }
    if (events.length == 1) {
      return [
        EventsGroupCell.text(events[0].name, size: 2, highlight: false)
      ];
    }
    if (events.length == 2) {
      return [
        EventsGroupCell.text(events[0].name, size: 1, highlight: true),
        EventsGroupCell.text(events[1].name, size: 1, highlight: false)
      ];
    }
    return [
      EventsGroupCell.text(events[0].name, size: 1, highlight: true),
      EventsGroupCell.text('...', size: 1, highlight: false)
    ];
  }
}
