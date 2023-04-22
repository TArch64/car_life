import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppTheme extends CupertinoThemeData {
  AppTheme(): super(
    brightness: window.platformBrightness,
    primaryColor: CupertinoColors.darkBackgroundGray
  );
}

extension ThemedBuildContext on BuildContext {
  CupertinoThemeData get theme => CupertinoTheme.of(this);
  bool get isDarkTheme => theme.brightness == Brightness.dark;
  bool get isLightTheme => theme.brightness == Brightness.light;
}
