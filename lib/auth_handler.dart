import 'package:flutter/cupertino.dart';
import 'package:car_life/pages/base/page_loader.dart';

import 'core/provider.dart';
import 'auth_api.dart';

class AuthHandler extends StatefulWidget {
  final WidgetBuilder buildAuth;
  final WidgetBuilder buildApp;

  const AuthHandler({
    super.key,
    required this.buildAuth,
    required this.buildApp,
  });

  @override
  State<AuthHandler> createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  final auth = AuthAPI();

  @override
  void initState() {
    super.initState();
    auth.update();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth.sessionChanges,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const CupertinoPageScaffold(child: PageLoader());
        }
        if (!snapshot.data!.isSignedIn) {
          return Provider.value(
            value: auth,
            builder: (context, _) => widget.buildAuth(context),
          );
        }
        return MultiProvider(
          providers: [
            Provider.value(value: auth),
            Provider.value(value: snapshot.data!)
          ],
          builder: (context, _) => widget.buildApp(context),
        );
      },
    );
  }
}
