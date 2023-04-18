import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoFormSection(
            children: [
              CupertinoTextFormFieldRow(
                prefix: Text(AppLocalizations.of(context)!.addCarFormNameLabel),
                autofocus: true,
              ),
              CupertinoTextFormFieldRow(
                prefix: Text(AppLocalizations.of(context)!.addCarFormNameMileage),
              )
            ]
          )
        ],
      )
    );
  }
}