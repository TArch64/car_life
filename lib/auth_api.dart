import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

abstract class _AuthData {
  final String email;
  final String password;

  const _AuthData({required this.email, required this.password});
}

class SignUpData extends _AuthData {
  const SignUpData({required super.email, required super.password});
}

class SignInData extends _AuthData {
  const SignInData({required super.email, required super.password});
}

class AuthSession {
  final AuthUser? user;
  bool get isSignedIn => user != null;

  AuthSession._(this.user);
}

class AuthAPI {
  final _sessionChangesController = StreamController<AuthSession>();
  Stream<AuthSession> get sessionChanges => _sessionChangesController.stream;

  signUp(SignUpData data) async {
    await Amplify.Auth.signUp(
      username: data.email,
      password: data.password,
      options: CognitoSignUpOptions(
        userAttributes: {
          CognitoUserAttributeKey.email: data.email,
        }
      )
    );
    await update();
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
    _sessionChangesController.add(AuthSession._(user));
  }
}
