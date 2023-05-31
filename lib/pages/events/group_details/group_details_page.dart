import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:car_life/core/init_state_dependencies.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/pages/base/page_layout.dart';
import 'package:car_life/models/Event.dart';
import 'package:car_life/models/Car.dart';

import '../events_group_data.dart';
import 'group_details_item.dart';

class GroupDetailsPage extends StatefulWidget {
  final EventsGroupData group;

  const GroupDetailsPage({
    super.key,
    required this.group
  });

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> with InitStateDependenciesMixin {
  List<Event> _events = [];
  late StreamSubscription<QuerySnapshot<Event>> _eventsSubscription;

  @override
  void didInitDependencies() {
    super.didInitDependencies();
    _listenGroupEvents(context);
  }

  _listenGroupEvents(BuildContext context) {
    final car = Provider.of<Car>(context, listen: false);
    final eventsQuery = Amplify.DataStore.observeQuery(
      Event.classType,
      where: Event.CARID.eq(car.id)
    );
    _eventsSubscription = eventsQuery.listen((snapshot) {
      final events = snapshot.items.where((event) => widget.group.eventInGroup(event)).toList();
      if (events.isEmpty) {
        Navigator.pop(context);
        return;
      }
      setState(() => _events = events);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _eventsSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final fromMileage = EventsGroupData.formatMileage(widget.group.fromMileage);
    final toMileage = EventsGroupData.formatMileage(widget.group.toMileage);
    return PageLayout(
      navigationTitle: "$fromMileage - $toMileage",
      backTitle: context.l10n.eventsGroupDetailsBackTitle,
      child: Builder(
        builder: (_) {
          if (_events.isEmpty) {
            return Container();
          }
          final items = _events.map((event) => GroupDetailsItem(
            key: Key("event-${event.id}"),
            event: event,
            onDelete: () => Amplify.DataStore.delete(event),
          ));
          return CupertinoScrollbar(
            child: CupertinoListSection(
              hasLeading: false,
              children: items.toList(),
            ),
          );
        },
      )
    );
  }
}