import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:car_life/core/confirm.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/pages/events/edit/edit_event_page.dart';
import 'package:car_life/models/car_model.dart';

typedef GroupDetailsItemDelete = Function();

class GroupDetailsItem extends StatelessWidget {
  final EventModel event;
  final EventDocumentReference eventRef;
  final GroupDetailsItemDelete onDelete;

  const GroupDetailsItem({
    required super.key,
    required this.event,
    required this.eventRef,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key!,
      closeOnScroll: true,
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        dismissible: DismissiblePane(
          confirmDismiss: () => _confirmDelete(context),
          closeOnCancel: true,
          onDismissed: onDelete,
        ),
        children: [
          SlidableAction(
            icon: CupertinoIcons.pencil,
            backgroundColor: CupertinoColors.systemYellow,
            foregroundColor: CupertinoColors.white,
            onPressed: _edit,
          ),
          SlidableAction(
            icon: CupertinoIcons.delete,
            backgroundColor: CupertinoColors.destructiveRed,
            foregroundColor: CupertinoColors.white,
            onPressed: _delete
          ),
        ],
      ),
      child: CupertinoListTile(
        title: Text(event.name)
      ),
    );
  }

  Future<bool> _confirmDelete(BuildContext context) {
    return Confirm.askDelete(context, context.l10n.eventsGroupDetailsDeleteItemName);
  }

  _delete(BuildContext context) async {
    if (await _confirmDelete(context)) onDelete();
  }

  _edit(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (_) => EditEventPage(event: event, eventRef: eventRef),
    ));
  }
}