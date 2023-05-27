import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'amplifyconfiguration.dart';
import 'auth_handler.dart';
import 'car_handler.dart';
import 'core/localization.dart';
import 'core/theme.dart';
import 'models/ModelProvider.dart';
import 'pages/sign_in/sign_in_page.dart';
import 'pages/cars/add/add_car_page.dart';
import 'pages/events/events_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(const MyApp());
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugin(AmplifyAPI());
  await Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));
  await Amplify.addPlugin(AmplifyAuthCognito());
  await Amplify.configure(amplifyconfig);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'CarLife',
      theme: AppTheme.create(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: AuthHandler(
        buildAuth: (_) => const SignInPage(),
        buildApp: (_) => CarHandler(
          buildCreateCar: (_) => const AddCarPage(),
          buildActiveCar: (_) => const EventsPage(),
        ),
      ),
    );
  }
}
