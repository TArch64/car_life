import 'package:car_life/core/confirm.dart';
import 'package:car_life/core/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_life/models/car_model.dart';

typedef GroupDetailsItemDelete = Function();

class GroupDetailsItem extends StatelessWidget {
  final EventModel event;
  final GroupDetailsItemDelete onDelete;

  const GroupDetailsItem({
    required super.key,
    required this.event,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: const BoxDecoration(
          color: CupertinoColors.destructiveRed,
        ),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(CupertinoIcons.delete,
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
      confirmDismiss: (_) => Confirm.askDelete(context, context.l10n.eventsGroupDetailsDeleteItemName),
      onDismissed: (_) => onDelete(),
      child: CupertinoListTile(
        title: Text(event.name),
      ),
    );
  }
}