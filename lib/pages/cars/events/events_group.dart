import 'package:flutter/cupertino.dart';

import 'events_group_data.dart';

class EventsGroup extends StatelessWidget {
  final EventsGroupData groupData;

  const EventsGroup({super.key, required this.groupData});

  @override
  Widget build(BuildContext context) {
    return Row(children: _eventWidgets + [_mileageWidget]);
  }

  Color get _cellBackgroundColor {
    return CupertinoColors.secondarySystemBackground.withOpacity(0.25);
  }

  Widget get _mileageWidget {
    final mileage = groupData.fromMileage / 1000;
    final formatted = mileage.toStringAsFixed(mileage.truncateToDouble() == mileage ? 0 : 1);
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: _cellBackgroundColor),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(formatted)],
        ),
      ),
    );
  }

  List<Widget> get _eventWidgets {
    return [
      Expanded(
        flex: 2,
        child: Container()
      )
    ];
  }
}
