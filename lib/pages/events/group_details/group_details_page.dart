import 'package:car_life/core/localization.dart';
import 'package:car_life/models/car_model.dart';
import 'package:flutter/cupertino.dart';
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
      child: const Text('details')
    );
  }
}