import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/models/event_model.dart';
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

class _AddEventPageState extends State<AddEventPage> {
  final _eventsRef = EventCollectionReference();
  late EventModel _creatingEvent;
  bool _creating = false;

  @override
  void initState() {
    super.initState();
    _creatingEvent = EventModel(mileage: widget.focusedGroupData.fromMileage);
  }

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
        event: _creatingEvent,
        onSubmit: () => _addCar(context)
      ),
    );
  }

  _addCar(BuildContext context) async {
    setState(() => _creating = true);
    _creatingEvent.carId = context.inject<CarModel>(listen: false).id;
    await _eventsRef.add(_creatingEvent);
    Navigator.pop(context);
  }
}