import 'package:car_life/models/Event.dart';
import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:car_life/core/init_state_dependencies.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/pages/base/page_layout.dart';

import '../events_group_data.dart';
import 'add_event_form.dart';

class AddEventPage extends StatefulWidget {
  final EventsGroupData  focusedGroupData;

  const AddEventPage({
    super.key,
    required this.focusedGroupData
  });

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> with InitStateDependenciesMixin {
  bool _creating = false;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.addEventNavigationTitle,
      backgroundColor: context.brightness.by(
        light: CupertinoColors.secondarySystemBackground,
        dark: CupertinoColors.systemBackground
      ),
      child: AddEventForm(
        creating: _creating,
        initialMileage: widget.focusedGroupData.fromMileage,
        onSubmit: (event) => _addCar(context, event)
      ),
    );
  }

  _addCar(BuildContext context, Event creatingEvent) async {
    setState(() => _creating = true);
    await Amplify.DataStore.save(creatingEvent);
    await Amplify.DataStore.save(creatingEvent.mileage);
    Navigator.pop(context);
  }
}