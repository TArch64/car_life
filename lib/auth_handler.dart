import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_cubit.dart';
import 'pages/base/page_loader.dart';
import 'application_wrapper.dart';

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
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().sync();
  }

  @override
  Widget build(BuildContext _) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        if (!state.isInited) {
          return const ApplicationWrapper(
            child: CupertinoPageScaffold(child: PageLoader()),
          );
        }
        if (!state.isSignedIn) {
          return ApplicationWrapper(
            child: widget.buildAuth(context)
          );
        }
        return ApplicationWrapper(
          child: widget.buildApp(context)
        );
      },
    );
  }
}
