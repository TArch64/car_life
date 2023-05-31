import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/alert.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/pages/base/page_layout.dart';

import '../sing_up_confirm/sign_up_confirm_page.dart';
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

  _signUp(BuildContext context, AuthCredentials credentials) async {
    setState(() => _signingUp = true);
    final auth = context.read<AuthCubit>();
    try {
      await auth.signUp(credentials);
      await Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (_) => SignUpConfirmPage(credentials: credentials),
      ));
    } catch(error) {
      setState(() => _signingUp = false);
      Alert.showError(context: context);
    }
  }
}
