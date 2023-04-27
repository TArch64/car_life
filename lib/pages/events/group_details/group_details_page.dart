import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:car_life/core/init_state_dependencies.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/pages/base/page_loader.dart';
import 'package:car_life/pages/base/page_layout.dart';

import '../events_group_data.dart';
import 'group_details_item.dart';

class GroupDetailsPage extends StatefulWidget {
  final EventsGroupData group;
  final EventQuery eventsRef;

  const GroupDetailsPage({
    super.key,
    required this.group,
    required this.eventsRef
  });

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> with InitStateDependenciesMixin {
  EventQuerySnapshot? _eventsSnapshot = null;
  late StreamSubscription<EventQuerySnapshot> _eventsSubscription;

  @override
  void didInitDependencies() {
    super.didInitDependencies();
    _eventsSubscription = widget.eventsRef.snapshots().listen((snapshot) {
      if (snapshot.docs.isEmpty) {
        Navigator.pop(context);
        return;
      }
      setState(() => _eventsSnapshot = snapshot);
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
          if (_eventsSnapshot == null) {
            return const PageLoader();
          }
          final events = _eventsSnapshot!.docs;

          if (events.isEmpty) {
            return Container();
          }

          final items = events.map((event) => GroupDetailsItem(
            key: Key("event-${event.id}"),
            event: event.data,
            eventRef: event.reference,
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