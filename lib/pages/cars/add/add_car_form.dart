import 'package:car_life/localization.dart';
import 'package:flutter/cupertino.dart';

class AddCarForm extends StatefulWidget {
  const AddCarForm({super.key});

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
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text(context.l10n.addCarFormMileageLabel),
                )
              ]
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoButton.filled(
                  child: Text(context.l10n.addCarFormSubmit),
                  onPressed: () {}
              ),
            )
          ],
        )
      )
    );
  }
}