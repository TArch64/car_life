import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/pages/base/page_layout.dart';

import 'edit_event_form.dart';

class EditEventPage extends StatefulWidget {
  final EventModel event;
  final EventDocumentReference eventRef;

  const EditEventPage({
    super.key,
    required this.event,
    required this.eventRef,
  });

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  late EventModel _editingEvent;
  bool _updating = false;

  @override
  void initState() {
    super.initState();
    _editingEvent = widget.event.copy();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.editEventNavigationTitle(widget.event.name),
      backgroundColor: context.brightness.by(
        light: CupertinoColors.secondarySystemBackground,
        dark: CupertinoColors.systemBackground
      ),
      child: EditEventForm(
        creating: _updating,
        event: _editingEvent,
        onSubmit: () => _updateCar(context)
      ),
    );
  }

  _updateCar(BuildContext context) async {
    setState(() => _updating = true);
    await widget.eventRef.update(name: _editingEvent.name);
    Navigator.pop(context);
  }
}