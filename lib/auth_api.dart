import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

export 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

abstract class AuthData {
  final String email;
  final String password;

  const AuthData({required this.email, required this.password});
}

class SignUpData extends AuthData {
  const SignUpData({required super.email, required super.password});
}

class SignInData extends AuthData {
  const SignInData({required super.email, required super.password});
}

class ConfirmSignUpData {
  final AuthData auth;
  final String code;

  const ConfirmSignUpData({required this.auth, required this.code});
}

class AppSession {
  final AuthUser? user;
  bool get isSignedIn => user != null;

  AppSession._(this.user);
}

class AuthAPI {
  final _sessionChangesController = StreamController<AppSession>();
  Stream<AppSession> get sessionChanges => _sessionChangesController.stream;

  signUp(SignUpData data) async {
    await Amplify.Auth.signUp(
      username: data.email,
      password: data.password,
      options: CognitoSignUpOptions(
        userAttributes: {
          CognitoUserAttributeKey.email: data.email,
        },
      ),
    );
  }

  confirmSignUp(ConfirmSignUpData data) async {
    await Amplify.Auth.confirmSignUp(
      username: data.auth.email,
      confirmationCode: data.code,
    );
    await signIn(SignInData(
      email: data.auth.email,
      password: data.auth.password,
    ));
  }

  signIn(SignInData data) async {
    await Amplify.Auth.signIn(
      username: data.email,
      password: data.password,
    );
    await update();
  }

  signOut() async {
    await Amplify.Auth.signOut();
  }

  update() async {
    final session = await Amplify.Auth.fetchAuthSession();
    final user = session.isSignedIn ? await Amplify.Auth.getCurrentUser() : null;
    _sessionChangesController.add(AppSession._(user));
  }
}
