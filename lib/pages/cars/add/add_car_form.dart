import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/models/Car.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/pages/base/button_loader.dart';

typedef AddCarSubmitForm = Function(Car car);

class AddCarForm extends StatefulWidget {
  final AddCarSubmitForm onSubmit;
  final bool creating;

  const AddCarForm({
    super.key,
    required this.onSubmit,
    required this.creating
  });

  @override
  State<AddCarForm> createState() => _AddCarFormState();
}

class _AddCarFormState extends State<AddCarForm> {
  final _nameController = TextEditingController();
  final _mileageController = TextEditingController();
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
                  controller: _nameController,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text(context.l10n.formMileageLabel),
                  validator: Validators.minInt(context, min: 0),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _mileageController,
                  keyboardType: TextInputType.number,
                ),
              ]
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoButton.filled(
                onPressed: () => _submit(context),
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

  _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final auth = context.read<AuthCubit>();
      widget.onSubmit(Car(
        userId: auth.state.user!.userId,
        name: _nameController.value.text,
        mileage: int.tryParse(_mileageController.value.text)!
      ));
    }
  }
}