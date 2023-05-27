import 'package:car_life/core/localization.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/models/Car.dart';
import 'package:car_life/models/Event.dart';
import 'package:car_life/models/EventMileage.dart';
import 'package:car_life/models/EventMileageRecurrence.dart';
import 'package:car_life/models/EventMileageRecurrenceEnds.dart';
import 'package:car_life/pages/base/button_loader.dart';
import 'package:car_life/pages/base/event_mileage_field.dart';
import 'package:flutter/cupertino.dart';

typedef AddEventFormSubmit = Function(Event event);

class AddEventForm extends StatefulWidget {
  final int initialMileage;
  final AddEventFormSubmit onSubmit;
  final bool creating;

  const AddEventForm(
      {super.key,
      required this.creating,
      required this.initialMileage,
      required this.onSubmit});

  @override
  State<AddEventForm> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  final _nameController = TextEditingController();
  late EventMileage _eventMileage;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _eventMileage = EventMileage(
      value: widget.initialMileage,
      recurrence: EventMileageRecurrence.SINGLE,
      recurrenceEnds: EventMileageRecurrenceEnds.NEVER,
      recurrenceInterval: 1000,
      recurrenceCount: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoFormSection(
            children: [
              CupertinoTextFormFieldRow(
                prefix: Text(context.l10n.formNameLabel),
                autofocus: true,
                validator: Validators.requireText(context),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
              ),
            ],
          ),
          EventMileageField(
            initialValue: _eventMileage,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (newValue) => _eventMileage = newValue!,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CupertinoButton.filled(
              onPressed: _submit,
              child: ButtonLoader(
                visible: widget.creating,
                color: context.theme.primaryContrastingColor,
                child: Text(context.l10n.addEventFormSubmit),
              ),
            ),
          )
        ],
      ),
    );
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(Event(
          name: _nameController.value.text,
          carId: context.inject<Car>().id,
          mileage: _eventMileage,
          eventMileageId: _eventMileage.id));
    }
  }
}
