import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_life/pages/base/page_loader.dart';

import 'core/provider.dart';

class AuthHandler extends StatefulWidget {
  const AuthHandler({super.key, required this.build});

  final WidgetBuilder build;

  @override
  State<AuthHandler> createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.signInAnonymously();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: null,
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, snapshot) {
        if (snapshot.data == null) {
          return const PageLoader();
        }
        return Provider<User>.value(
          value: snapshot.data!,
          child: widget.build(context),
        );
      },
    );
  }
}
