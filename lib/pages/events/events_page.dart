import 'package:flutter/cupertino.dart';
import 'package:car_life/auth_api.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/amplify_query.dart';
import 'package:car_life/core/init_state_dependencies.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/models/Car.dart';
import 'package:car_life/models/Event.dart';
import 'package:car_life/pages/base/page_layout.dart';
import 'package:car_life/pages/base/button_dropdown.dart';
import 'package:car_life/pages/events/events_group_cell.dart';

import 'events_group.dart';
import 'events_group_data.dart';
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
    super.didInitDependencies();
    final car = context.inject<Car>();
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
    final car = context.inject<Car>();
    final auth = context.inject<AuthAPI>();
    final borderColor = EventsGroupCell.accentColor(context);
    return PageLayout(
      navigationTitle: car.name,
      navigationPrepend: ButtonDropdown(
        padding: const EdgeInsets.all(4),
        actions: [
          ButtonDropdownAction(
            isDestructiveAction: true,
            child: Text(context.l10n.signOutTitle),
            onPressed: () => auth.signOut(),
          ),
        ],
        child: const Icon(CupertinoIcons.ellipsis_vertical),
      ),
      navigationAppend: CupertinoButton(
        padding: const EdgeInsets.all(4),
        onPressed: () => _initiateAddEvent(context),
        child: const Icon(CupertinoIcons.add),
      ),
      child: AmplifyQuery(
        type: Event.classType,
        where: Event.CARID.eq(car.id),
        builder: (context, snapshot) => ListView.builder(
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
                events: _selectGroupEvents(group, snapshot.data)
              ),
            );
          },
        ),
      ),
    );
  }

  _initiateAddEvent(BuildContext context) {
    final index = _scrollOffsetToIndex(context, _scrollController.offset);
    final group = EventsGroupData(index);
    final car = context.inject<Car>(listen: false);
    Navigator.push(context, CupertinoPageRoute(
      builder: (_) => Provider.value(
        value: car,
        child: AddEventPage(focusedGroupData: group),
      ),
    ));
  }

  List<Event> _selectGroupEvents(EventsGroupData group, QuerySnapshot<Event>? snapshot) {
    return snapshot?.items.where((event) => group.eventInGroup(event)).toList() ?? [];
  }
}