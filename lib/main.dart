import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/theme.dart';
import 'core/firebase_options.dart';
import 'auth_handler.dart';
import 'car_handler.dart';
import 'core/localization.dart';
import 'pages/cars/add/add_car_page.dart';
import 'pages/events/events_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
        build: (_) => CarHandler(
          buildCreateCar: (_) => const AddCarPage(),
          buildActiveCar:(_) => const EventsPage(),
        ),
      ),
    );
  }
}
