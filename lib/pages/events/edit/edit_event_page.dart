import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/Event.dart';
import 'package:car_life/pages/base/page_layout.dart';

import 'edit_event_form.dart';

class EditEventPage extends StatefulWidget {
  final Event event;

  const EditEventPage({
    super.key,
    required this.event,
  });

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  bool _updating = false;

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
        initialEvent: widget.event,
        onSubmit: (event) => _updateCar(context, event)
      ),
    );
  }

  _updateCar(BuildContext context, Event editedEvent) async {
    setState(() => _updating = true);
    Amplify.DataStore.save(editedEvent);
    Navigator.pop(context);
  }
}