import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_life/bloc/auth_cubit.dart';
import 'package:car_life/pages/base/page_loader.dart';

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
    context.read<AuthCubit>().update();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        if (!state.isInited) {
          return const CupertinoPageScaffold(child: PageLoader());
        }
        if (!state.isSignedIn) {
          return widget.buildAuth(context);
        }
        return widget.buildApp(context);
      },
    );
  }
}
