import 'package:car_life/pages/events/group_details/group_details_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/pages/base/page_loader.dart';
import 'package:car_life/pages/base/page_layout.dart';

import '../events_group_data.dart';

class GroupDetailsPage extends StatelessWidget {
  final EventsGroupData group;
  final EventQuery eventsRef;

  const GroupDetailsPage({
    super.key,
    required this.group,
    required this.eventsRef
  });

  @override
  Widget build(BuildContext context) {
    final fromMileage = EventsGroupData.formatMileage(group.fromMileage);
    final toMileage = EventsGroupData.formatMileage(group.toMileage);

    return PageLayout(
      navigationTitle: "$fromMileage - $toMileage",
      backTitle: context.l10n.eventsGroupDetailsBackTitle,
      child: FirestoreBuilder(
        ref: eventsRef,
        builder: (_, snapshot, __) {
          if (snapshot.data == null) {
            return const PageLoader();
          }
          final events = snapshot.data!.docs;

          if (events.isEmpty) {
            return Container();
          }

          final items = events.map((event) => GroupDetailsItem(
            key: Key("event-${event.id}"),
            event: event.data,
            eventRef: event.reference,
            onDelete: () async {
              if (events.length == 1) {
                Navigator.pop(context);
              }
              await event.reference.delete();
            },
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