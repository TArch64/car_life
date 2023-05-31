import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/Event.dart';
import 'package:car_life/models/Car.dart';

import 'events_group_data.dart';
import 'events_group_cell.dart';
import 'add/add_event_page.dart';
import 'group_details/group_details_page.dart';

class EventsGroup extends StatelessWidget {
  final EventsGroupData group;
  final List<Event> events;

  const EventsGroup({
    super.key,
    required this.group,
    required this.events
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(color: CupertinoColors.systemBackground),
        child: Row(children: _eventWidgets(context, events) + [_mileageWidget(context)])
      ),
      onTap: () => events.isEmpty ? _openAdd(context) : _openDetails(context),
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

  List<Widget> _eventWidgets(BuildContext context, List<Event> events) {
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

  _openAdd(BuildContext context) {
    final car = Provider.of<Car>(context, listen: false);
    return Navigator.push(context, CupertinoPageRoute(
      builder: (_) => Provider.value(
        value: car,
        child: AddEventPage(focusedGroupData: group),
      ),
    ));
  }

  _openDetails(BuildContext context) {
    final car = Provider.of<Car>(context, listen: false);
    Navigator.push(context, CupertinoPageRoute(
      builder: (_) => Provider.value(
        value: car,
        child: GroupDetailsPage(group: group),
      )
    ));
  }
}
