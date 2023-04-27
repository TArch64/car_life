import 'package:flutter/cupertino.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/pages/base/button_loader.dart';
import 'package:car_life/pages/base/cupertino_int_form_field_row.dart';

typedef AddCarSubmitForm = Function();

class AddCarForm extends StatefulWidget {
  final CarModel car;
  final AddCarSubmitForm onSubmit;
  final bool creating;

  const AddCarForm({
    super.key,
    required this.car,
    required this.onSubmit,
    required this.creating
  });

  @override
  State<AddCarForm> createState() => _AddCarFormState();
}

class _AddCarFormState extends State<AddCarForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
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
                  onSaved: (value) => setState(() => widget.car.name = value ?? ''),
                ),
                CupertinoIntFormFieldRow(
                  prefix: Text(context.l10n.formMileageLabel),
                  validator: Validators.minInt(context, min: 0),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => setState(() => widget.car.mileage = value ?? 0),
                ),
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
                  child: Text(context.l10n.addCarFormSubmit),
                ),
              ),
            )
          ],
        )
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