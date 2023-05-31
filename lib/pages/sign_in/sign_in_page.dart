import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:car_life/core/localization.dart';
import 'package:car_life/core/alert.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/pages/app_screen.dart';
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

  _signIn(BuildContext context, AuthCredentials credentials) async {
    setState(() => _signingIn = true);
    final auth = context.read<AuthCubit>();
    try {
      await auth.signIn(credentials);
    } on UserNotFoundException catch (_) {
      setState(() => _signingIn = false);
      Alert.showError(
        context: context,
        text: context.l10n.signInIncorrectCredentials
      );
      await Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (_) => const AppScreen(),
      ));
    } on UserNotConfirmedException catch (_) {
      await Navigator.pushReplacement(context, CupertinoPageRoute(
        builder: (_) => SignUpConfirmPage(credentials: credentials),
      ));
    } catch(error) {
      setState(() => _signingIn = false);
      Alert.showError(context: context);
    }
  }
}
