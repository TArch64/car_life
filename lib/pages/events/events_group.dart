import 'package:car_life/core/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/models/car_model.dart';

import 'events_group_data.dart';
import 'events_group_cell.dart';
import 'add/add_event_page.dart';
import 'group_details/group_details_page.dart';

class EventsGroup extends StatelessWidget {
  final EventsGroupData group;

  const EventsGroup({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    final carRef = context.inject<CarDocumentReference>();
    final eventsRef = carRef.events.whereMileage(
      isGreaterThanOrEqualTo: group.fromMileage,
      isLessThan: group.toMileage
    );
    return FirestoreBuilder(
      ref: eventsRef,
      builder: (_, snapshot, __) {
        final events = snapshot.data?.docs.map((event) => event.data).toList() ?? [];
        return GestureDetector(
          child: Container(
            decoration: const BoxDecoration(
              color: CupertinoColors.systemBackground,
            ),
            child: Row(children: _eventWidgets(context, events) + [_mileageWidget(context)])
          ),
          onTap: () => events.isEmpty
            ? _openAdd(context, carRef)
            : _openDetails(context, eventsRef),
        );
      },
    );
  }

  Widget _mileageWidget(BuildContext context) {
    return EventsGroupCell.text(EventsGroupData.formatMileage(group.fromMileage),
      size: 1,
      decoration: BoxDecoration(
        color: EventsGroupCell.accentColor(context),
      ),
    );
  }

  List<Widget> _eventWidgets(BuildContext context, List<EventModel> events) {
    if (events.isEmpty) {
      return [EventsGroupCell.none(size: 2)];
    }
    if (events.length == 1) {
      return [EventsGroupCell.text(events[0].name, size: 2)];
    }
    final decoration = BoxDecoration(
      border: Border(
        right: BorderSide(
          color: EventsGroupCell.accentColor(context),
          width: 3
        ),
      )
    );
    if (events.length == 2) {
      return [
        EventsGroupCell.text(events[0].name, size: 1, decoration: decoration),
        EventsGroupCell.text(events[1].name, size: 1)
      ];
    }
    return [
      EventsGroupCell.text(events[0].name, size: 1, decoration: decoration),
      EventsGroupCell.text(context.l10n.eventsMoreCollapsed(events.length - 1), size: 1),
    ];
  }

  _openAdd(BuildContext context, CarDocumentReference carRef) {
    return Navigator.push(context, CupertinoPageRoute(
      builder: (_) => Provider.value(
        value: carRef,
        child: AddEventPage(focusedGroupData: group),
      ),
    ));
  }

  _openDetails(BuildContext context, EventQuery eventsRef) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (_) => GroupDetailsPage(group: group, eventsRef: eventsRef)
    ));
  }
}
