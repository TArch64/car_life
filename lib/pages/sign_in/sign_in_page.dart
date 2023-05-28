import 'package:flutter/cupertino.dart';
import 'package:car_life/auth_api.dart';
import 'package:car_life/core/provider.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/alert.dart';
import 'package:car_life/pages/base/page_layout.dart';

import '../sing_up_confirm/sign_up_confirm_page.dart';
import 'sign_in_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var _signingIn = false;

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.signInNavigationTitle,
      inlineNavigationTitle: true,
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: SignInForm(
        signingIn: _signingIn,
        onSignIn: (data) => _signIn(context, data),
      )
    );
  }

  _signIn(BuildContext context, SignInData data) async {
    setState(() => _signingIn = true);
    final auth = context.inject<AuthAPI>(listen: false);
    try {
      await auth.signIn(data);
    } on UserNotFoundException catch (_) {
      setState(() => _signingIn = false);
      Alert.showError(
        context: context,
        text: context.l10n.signInIncorrectCredentials
      );
    } on UserNotConfirmedException catch (_) {
      await Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (_) => Provider.value(
          value: auth,
          child: SignUpConfirmPage(authData: data),
        ),
      ));
    } catch(error) {
      setState(() => _signingIn = false);
      Alert.showError(context: context);
    }
  }
}
