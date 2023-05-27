import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/models/Event.dart';
import 'package:car_life/models/EventMileage.dart';
import 'package:car_life/pages/base/event_mileage_field.dart';
import 'package:car_life/pages/base/button_loader.dart';

typedef EditEventFormSubmit = Function(Event event);

class EditEventForm extends StatefulWidget {
  final Event initialEvent;
  final EditEventFormSubmit onSubmit;
  final bool creating;

  const EditEventForm({
    super.key,
    required this.creating,
    required this.initialEvent,
    required this.onSubmit
  });

  @override
  State<EditEventForm> createState() => _EditEventFormState();
}

class _EditEventFormState extends State<EditEventForm> {
  late TextEditingController _nameController;
  late EventMileage _eventMileage;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialEvent.name);
    _eventMileage = widget.initialEvent.mileage;
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
              )
            ]
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
                child: Text(context.l10n.editEventFormSubmit),
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
      widget.onSubmit(widget.initialEvent.copyWith(
        name: _nameController.value.text,
        mileage: _eventMileage
      ));
    }
  }
}

