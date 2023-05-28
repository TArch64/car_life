import 'package:flutter/cupertino.dart';
import 'package:car_life/auth_api.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/pages/base/button_loader.dart';

import '../sign_in/sign_in_page.dart';

typedef OnSignUp = Function(SignUpData data);

class SignUpForm extends StatefulWidget {
  final bool signingUp;
  final OnSignUp onSignUp;

  const SignUpForm({
    super.key,
    required this.signingUp,
    required this.onSignUp
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                  prefix: Text(context.l10n.formEmailLabel),
                  autofocus: true,
                  validator: Validators.requireEmail(context),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                CupertinoTextFormFieldRow(
                  prefix: Text(context.l10n.formPasswordLabel),
                  validator: Validators.requireStringMinLength(context, min: 8),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  obscureText: true,
                ),
              ]
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CupertinoButton.filled(
                    onPressed: _submit,
                    child: ButtonLoader(
                      visible: widget.signingUp,
                      color: context.theme.primaryContrastingColor,
                      child: Text(context.l10n.signUpFormSubmit),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(context.l10n.signUpActionDividerText),
                  ),
                  CupertinoButton(
                    onPressed: () => Navigator.push(context, CupertinoPageRoute(
                      builder: (context) => const SignInPage(),
                    )),
                    child: Text(context.l10n.signUpSignInLink, style: const TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSignUp(SignUpData(
        email: _emailController.value.text,
        password: _passwordController.value.text
      ));
    }
  }
}
