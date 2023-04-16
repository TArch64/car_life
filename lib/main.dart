import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'firebase_options.dart';
import 'auth_provider.dart';

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
      home: AuthProvider(
        build: () => const CupertinoPageScaffold(child: Text("signed in")),
      ),
    );
  }
}
