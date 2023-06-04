import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(const Application());
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugin(AmplifyAPI());
  await Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));
  await Amplify.addPlugin(AmplifyAuthCognito());
  await Amplify.configure(amplifyconfig);
}
