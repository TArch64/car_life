import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

typedef BuildSignedIn = Widget Function();

class AuthProvider extends StatefulWidget {
  const AuthProvider({super.key, required this.build});

  final BuildSignedIn build;

  @override
  State<AuthProvider> createState() => _AuthProviderState();
}

class _AuthProviderState extends State<AuthProvider> {
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
          return _loading();
        }
        return Provider<User>.value(
          value: snapshot.data!,
          child: widget.build(),
        );
      },
    );
  }

  Widget _loading() {
    return CupertinoPageScaffold(
        child: Stack(
            children: const [
              Positioned.fill(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ]
        )
    );
  }
}
