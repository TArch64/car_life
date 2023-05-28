import 'package:flutter/cupertino.dart';
import 'package:car_life/auth_api.dart';
import 'package:car_life/core/alert.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/pages/base/page_layout.dart';

import 'sign_up_confirm_form.dart';

class SignUpConfirmPage extends StatefulWidget {
  final AuthData authData;

  const SignUpConfirmPage({
    super.key,
    required this.authData
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
    final auth = context.inject<AuthAPI>(listen: false);
    try {
      await auth.confirmSignUp(ConfirmSignUpData(
        auth: widget.authData,
        code: code
      ));
    } catch(error) {
      setState(() => _confirming = false);
      Alert.showError(context: context);
    }
  }
}
