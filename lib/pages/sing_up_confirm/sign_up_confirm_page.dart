import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/core/alert.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/pages/app_screen.dart';
import 'package:car_life/pages/base/page_layout.dart';

import 'sign_up_confirm_form.dart';

class SignUpConfirmPage extends StatefulWidget {
  final AuthCredentials credentials;

  const SignUpConfirmPage({
    super.key,
    required this.credentials
  });

  @override
  State<SignUpConfirmPage> createState() => _SignUpConfirmPageState();
}

class _SignUpConfirmPageState extends State<SignUpConfirmPage> {
  bool _confirming = false;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.confirmSignUpNavigationTitle,
      inlineNavigationTitle: true,
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: SignUpConfirmForm(
        confirming: _confirming,
        onConfirm: (code) => _confirm(context, code),
      ),
    );
  }

  _confirm(BuildContext context, String code) async {
    setState(() => _confirming = true);
    final auth = context.read<AuthCubit>();
    try {
      await auth.confirmSignUp(ConfirmSignUpData(
        credentials: widget.credentials,
        code: code
      ));
      await Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (_) => const AppScreen(),
      ));
    } catch(error) {
      setState(() => _confirming = false);
      Alert.showError(context: context);
    }
  }
}
