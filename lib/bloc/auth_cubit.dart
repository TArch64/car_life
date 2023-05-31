import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class AuthCredentials {
  final String email;
  final String password;

  const AuthCredentials({
    required this.email,
    required this.password
  });
}

class ConfirmSignUpData {
  final AuthCredentials credentials;
  final String code;

  const ConfirmSignUpData({
    required this.credentials,
    required this.code
  });
}

class AuthCubitState {
  final AuthUser? user;
  final bool isInited;
  bool get isSignedIn => user != null;

  const AuthCubitState._(this.user, this.isInited);
}

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(): super(const AuthCubitState._(null, false));

  signUp(AuthCredentials credentials) async {
    await Amplify.Auth.signUp(
      username: credentials.email,
      password: credentials.password,
      options: CognitoSignUpOptions(
        userAttributes: {
          CognitoUserAttributeKey.email: credentials.email,
        },
      ),
    );
  }

  confirmSignUp(ConfirmSignUpData data) async {
    await Amplify.Auth.confirmSignUp(
      username: data.credentials.email,
      confirmationCode: data.code,
    );
    await signIn(data.credentials);
  }

  signIn(AuthCredentials credentials) async {
    await Amplify.Auth.signIn(
      username: credentials.email,
      password: credentials.password,
    );
    await update();
  }

  signOut() async {
    await Amplify.Auth.signOut();
  }

  update() async {
    final session = await Amplify.Auth.fetchAuthSession();
    final user = session.isSignedIn ? await Amplify.Auth.getCurrentUser() : null;
    emit(AuthCubitState._(user, true));
  }
}