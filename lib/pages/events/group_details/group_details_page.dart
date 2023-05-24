import 'dart:async';

import 'package:car_life/core/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_life/core/init_state_dependencies.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/pages/base/page_layout.dart';

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
  List<EventQueryDocumentSnapshot> _events = [];
  late StreamSubscription<List<EventQueryDocumentSnapshot>> _eventsSubscription;

  @override
  void didInitDependencies() {
    super.didInitDependencies();
    _listenGroupEvents(context);
  }

  _listenGroupEvents(BuildContext context) {
    final carRef = context.inject<CarDocumentReference>();

    final groupEvents = carRef.events.snapshots().map((snapshot) {
      return snapshot.docs.where((document) => widget.group.eventInGroup(document.data)).toList();
    });

    _eventsSubscription = groupEvents.listen((events) {
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
            onDelete: () => event.reference.delete(),
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