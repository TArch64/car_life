import 'package:flutter/cupertino.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/pages/base/button_loader.dart';

typedef OnSignUpConfirm = Function(String code);

class SignUpConfirmForm extends StatefulWidget {
  final OnSignUpConfirm onConfirm;
  final bool confirming;

  const SignUpConfirmForm({
    super.key,
    required this.onConfirm,
    required this.confirming,
  });

  @override
  State<SignUpConfirmForm> createState() => _SignUpConfirmFormState();
}

class _SignUpConfirmFormState extends State<SignUpConfirmForm> {
  final _codeController = TextEditingController();
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
                  prefix: Text(context.l10n.formCodeLabel),
                  autofocus: true,
                  validator: Validators.requireText(context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _codeController,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoButton.filled(
                onPressed: _confirm,
                child: ButtonLoader(
                  visible: widget.confirming,
                  color: context.theme.primaryContrastingColor,
                  child: Text(context.l10n.confirmSignUpSubmit),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _confirm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onConfirm(_codeController.value.text);
    }
  }
}
