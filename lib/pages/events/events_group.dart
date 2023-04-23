import 'package:car_life/core/provider.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/models/car_model.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_life/models/event_model.dart';

import 'events_group_data.dart';

class EventsGroup extends StatelessWidget {
  final EventsGroupData groupData;
  final _eventsRef = EventCollectionReference();

  EventsGroup({super.key, required this.groupData});

  @override
  Widget build(BuildContext context) {
    final car = context.inject<CarModel>();
    return FirestoreBuilder(
      ref: _eventsRef
          .whereCarId(isEqualTo: car.id)
          .whereMileage(isGreaterThanOrEqualTo: groupData.fromMileage, isLessThan: groupData.toMileage),

      builder: (_, snapshot, __) {
        final events = snapshot.data?.docs.map((event) => event.data).toList() ?? [];
        return Row(children: _eventWidgets(events) + [_mileageWidget(context)]);
      },
    );
  }

  Color _cellBackgroundColor(BuildContext context) {
    return context.brightness.by(
      light: CupertinoColors.secondarySystemBackground.withOpacity(0.35),
      dark: CupertinoColors.systemBackground.withOpacity(0.1)
    );
  }

  Widget _mileageWidget(BuildContext context) {
    final mileage = groupData.fromMileage / 1000;
    final formatted = mileage.toStringAsFixed(mileage.truncateToDouble() == mileage ? 0 : 1);
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: _cellBackgroundColor(context)),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("${formatted}k")],
        ),
      ),
    );
  }

  List<Widget> _eventWidgets(List<EventModel> events) {
    return [
      Expanded(
        flex: 2,
        child: Container()
      )
    ];
  }
}
