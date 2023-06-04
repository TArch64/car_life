import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/bloc/events_cubit.dart';
import 'package:car_life/bloc/events_group_data.dart';
import 'package:car_life/pages/base/page_layout.dart';

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

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  late StreamSubscription<EventsCubitState> _eventsSubscription;

  @override
  void initState() {
    super.initState();
    _listenGroupEvents(context);
  }

  _listenGroupEvents(BuildContext context) {
    _eventsSubscription = context.read<EventsCubit>().stream.listen((state) {
      if (state.events.isEmpty) {
        Navigator.pop(context);
      }
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
      child: BlocBuilder<EventsCubit, EventsCubitState>(
        builder: (_, state) {
          if (state.events.isEmpty) {
            return Container();
          }
          final items = state.events.map((event) => GroupDetailsItem(
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
      ),
    );
  }
}