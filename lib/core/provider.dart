import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

export 'package:provider/provider.dart';

extension ProviderBuildContext on BuildContext {
  T inject<T>({bool listen = true}) {
    return Provider.of(this, listen: listen);
  }
}