import 'package:flutter/cupertino.dart';
import 'package:car_life/auth_api.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/alert.dart';
import 'package:car_life/pages/base/page_layout.dart';

import 'sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _signingUp = false;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.signUpNavigationTitle,
      inlineNavigationTitle: true,
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: SignUpForm(
        signingUp: _signingUp,
        onSignUp: (data) => _signUp(context, data),
      )
    );
  }

  _signUp(BuildContext context, SignUpData data) async {
    setState(() => _signingUp = true);
    final auth = context.inject<AuthAPI>(listen: false);
    try {
      await auth.signUp(data);
    } catch(_) {
      setState(() => _signingUp = false);
      Alert.showError(context: context);
    }
  }
}
