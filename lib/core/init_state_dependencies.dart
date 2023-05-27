import 'package:flutter/cupertino.dart';

mixin InitStateDependenciesMixin<T extends StatefulWidget> on State<T> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      didInitDependencies();
      _initialized = true;
    }
  }

  void didInitDependencies() {}
}