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

    _scrollController = ScrollController(
      initialScrollOffset: _indexToScrollOffset(context, groupData.index)
    );
  }

  double _screenOffset(BuildContext context) {
    return MediaQuery.of(context).size.height / 2;
  }

  double _indexToScrollOffset(BuildContext context, int index) {
    return (index * _groupHeight) - _screenOffset(context);
  }

  int _scrollOffsetToIndex(BuildContext context, double scrollOffset) {
    return ((scrollOffset + _screenOffset(context)) / _groupHeight).round();
  }

  @override
  Widget build(BuildContext context) {
    final car = context.inject<CarModel>();
    final borderColor = _borderColor(context);

    return PageLayout(
      navigationTitle: car.name,
      navigationAppend: CupertinoButton(
        padding: const EdgeInsets.all(4),
        onPressed: () => _initiateAddEvent(context),
        child: const Icon(CupertinoIcons.add, color: CupertinoColors.activeBlue),
      ),
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

  _initiateAddEvent(BuildContext context) {
    final index = _scrollOffsetToIndex(context, _scrollController.offset);
    final groupData = EventsGroupData(index);
    print(groupData.fromMileage);
  }
}