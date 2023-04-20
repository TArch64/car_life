import 'package:car_life/localization.dart';
import 'package:car_life/models/car_model.dart';
import 'package:car_life/validators.dart';
import 'package:flutter/cupertino.dart';

typedef AddCarSubmitForm = Function();

class AddCarForm extends StatefulWidget {
  final CarModel car;
  final AddCarSubmitForm onSubmit;

  const AddCarForm({
    super.key,
    required this.car,
    required this.onSubmit
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
                  prefix: Text(context.l10n.addCarFormNameLabel),
                  autofocus: true,
                  validator: Validators.requireText(context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => setState(() => widget.car.name = value ?? ''),
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text(context.l10n.addCarFormMileageLabel),
                  keyboardType: TextInputType.number,
                  validator: Validators.minInt(context, min: 0),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (value) => setState(() => widget.car.mileage = int.tryParse(value ?? '') ?? 0),
                )
              ]
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoButton.filled(
                onPressed: _submit,
                child: Text(context.l10n.addCarFormSubmit)
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