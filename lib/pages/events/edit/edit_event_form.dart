import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/pages/base/button_loader.dart';

typedef EditEventFormSubmit = Function();

class EditEventForm extends StatefulWidget {
  final EventModel event;
  final EditEventFormSubmit onSubmit;
  final bool creating;

  const EditEventForm({
    super.key,
    required this.creating,
    required this.event,
    required this.onSubmit
  });

  @override
  State<EditEventForm> createState() => _EditEventFormState();
}

class _EditEventFormState extends State<EditEventForm> {
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
                  prefix: Text(context.l10n.editEventFormNameLabel),
                  autofocus: true,
                  initialValue: widget.event.name,
                  validator: Validators.requireText(context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => setState(() => widget.event.name = value ?? ''),
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text(context.l10n.editEventFormMileageLabel),
                  initialValue: widget.event.mileage.toString(),
                  enabled: false,
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
                  child: Text(context.l10n.editEventFormSubmit),
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

