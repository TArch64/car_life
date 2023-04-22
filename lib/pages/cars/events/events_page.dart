import 'package:car_life/core/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_life/core/init_state_dependencies.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/pages/base/page_layout.dart';

import 'events_group.dart';
import 'events_group_data.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with InitStateDependenciesMixin {
  final double _groupHeight = 150;
  late ScrollController _scrollController;

  @override
  void didInitDependencies() {
    super.didInitDependencies();
    final car = context.inject<CarModel>();
    final groupData = EventsGroupData.fromMileage(car.mileage);
    final groupOffset = groupData.index * _groupHeight;
    final screenHeight = MediaQuery.of(context).size.height;
    final magicScreenOffset = (screenHeight / 3) * 2;

    _scrollController = ScrollController(
      initialScrollOffset: groupOffset + magicScreenOffset
    );
  }

  @override
  Widget build(BuildContext context) {
    final car = context.inject<CarModel>();
    final borderColor = _borderColor(context);

    return PageLayout(
      navigationTitle: car.name,
      child: ListView.builder(
        reverse: true,
        controller: _scrollController,
        itemBuilder: (_, index) => Container(
          height: _groupHeight,
          decoration: BoxDecoration(
            border: index == 0 ? null : Border(
              bottom: BorderSide(width: 1, color: borderColor)
            )
          ),
          child: EventsGroup(groupData: EventsGroupData(index))
        ),
      )
    );
  }

  Color _borderColor(BuildContext context) {
    if (context.isLightTheme) {
      return CupertinoColors.secondarySystemBackground;
    }
    return CupertinoColors.systemBackground.withOpacity(0.2);
  }
}