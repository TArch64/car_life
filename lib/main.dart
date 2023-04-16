import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';
import 'auth_handler.dart';
import 'car_handler.dart';

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
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue
      ),
      home: AuthHandler(
        build: (_) => CarHandler(
          buildCreateCar: (_) => const CupertinoPageScaffold(child: Text('no car')),
          buildActiveCar:(_) => const CupertinoPageScaffold(child: Text('car created')),
        ),
      ),
    );
  }
}
