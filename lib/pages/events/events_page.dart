import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/init_state_dependencies.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/bloc/car_cubit.dart';
import 'package:car_life/bloc/event_cubit.dart';
import 'package:car_life/bloc/events_group_data.dart';
import 'package:car_life/pages/app_screen.dart';
import 'package:car_life/pages/base/page_layout.dart';
import 'package:car_life/pages/base/button_dropdown.dart';
import 'package:car_life/pages/events/events_group_cell.dart';

import 'events_group.dart';
import 'add/add_event_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with InitStateDependenciesMixin {
  static const double _groupHeight = 150;
  late ScrollController _scrollController;

  @override
  void didInitDependencies() {
    final car = context.read<CarCubit>().state.car!;
    final groupData = EventsGroupData.fromMileage(car.mileage);
    _scrollController = ScrollController(
      initialScrollOffset: _indexToScrollOffset(context, groupData.index)
    );
    context.read<EventCubit>().listen(car: car);
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
    return BlocBuilder<CarCubit, CarCubitState>(
      builder: (context, carState) {
        final borderColor = EventsGroupCell.accentColor(context);
        return PageLayout(
          navigationTitle: carState.car!.name,
          navigationPrepend: ButtonDropdown(
            padding: const EdgeInsets.all(4),
            actions: [
              ButtonDropdownAction(
                isDestructiveAction: true,
                child: Text(context.l10n.signOutTitle),
                onPressed: () => _signOut(context),
              ),
            ],
            child: const Icon(CupertinoIcons.ellipsis_vertical),
          ),
          navigationAppend: CupertinoButton(
            padding: const EdgeInsets.all(4),
            onPressed: () => _initiateAddEvent(context),
            child: const Icon(CupertinoIcons.add),
          ),
          child: BlocBuilder<EventCubit, EventCubitState>(
            builder: (_, eventsState) => ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemBuilder: (_, index) {
                final group = EventsGroupData(index);
                return Container(
                  height: _groupHeight,
                  decoration: BoxDecoration(
                    border: index == 0 ? null : Border(
                      bottom: BorderSide(width: 3, color: borderColor)
                    )
                  ),
                  child: EventsGroup(
                    group: group,
                    events: group.selectEvents(eventsState.events),
                  ),
                );
              },
            ),
          )
        );
      },
    );
  }

  _initiateAddEvent(BuildContext context) {
    final index = _scrollOffsetToIndex(context, _scrollController.offset);
    Navigator.push(context, CupertinoPageRoute(
      builder: (_) => AddEventPage(focusedGroupData: EventsGroupData(index)),
    ));
  }

  _signOut(BuildContext context) async {
    await context.read<AuthCubit>().signOut();
    await Navigator.pushReplacement(context, CupertinoPageRoute(
      builder: (_) => const AppScreen(),
    ));
  }
}