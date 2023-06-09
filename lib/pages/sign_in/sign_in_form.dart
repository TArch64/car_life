import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';
import 'package:car_life/core/validators.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/pages/base/button_loader.dart';

import '../sign_up/sign_up_page.dart';

typedef OnSignIn = Function(AuthCredentials data);

class SignInForm extends StatefulWidget {
  final bool signingIn;
  final OnSignIn onSignIn;

  const SignInForm({
    super.key,
    required this.signingIn,
    required this.onSignIn
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
                      visible: widget.signingIn,
                      color: context.theme.primaryContrastingColor,
                      child: Text(context.l10n.signInFormSubmit),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(context.l10n.signInActionDividerText),
                  ),
                  CupertinoButton(
                    onPressed: () => _openSignUp(context),
                    child: Text(context.l10n.signInSignUpLink, style: const TextStyle(
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
      widget.onSignIn(AuthCredentials(
        email: _emailController.value.text,
        password: _passwordController.value.text
      ));
    }
  }

  _openSignUp(BuildContext context) {
    Navigator.pushReplacement(context, CupertinoPageRoute(
      builder: (_) => const SignUpPage(),
    ));
  }
}
