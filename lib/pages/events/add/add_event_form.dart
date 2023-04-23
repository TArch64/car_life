import 'package:car_life/core/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/models/event_model.dart';
import 'package:car_life/pages/base/button_loader.dart';

typedef AddEventFormSubmit = Function();

class AddEventForm extends StatefulWidget {
  final EventModel event;
  final AddEventFormSubmit onSubmit;
  final bool creating;

  const AddEventForm({
    super.key,
    required this.creating,
    required this.event,
    required this.onSubmit
  });

  @override
  State<AddEventForm> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  final _formKey = GlobalKey<FormState>();

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
                  prefix: Text(context.l10n.addEventFormNameLabel),
                  autofocus: true,
                  validator: Validators.requireText(context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => setState(() => widget.event.name = value ?? ''),
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text(context.l10n.addEventFormMileageLabel),
                  keyboardType: TextInputType.number,
                  validator: Validators.minInt(context, min: 0),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: widget.event.mileage.toString(),
                  onSaved: (value) => setState(() => widget.event.mileage = int.tryParse(value ?? '') ?? 0),
                )
              ]
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
        )
    );
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit();
    }
  }
}

