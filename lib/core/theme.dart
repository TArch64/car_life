import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BrightnessData {
  final Brightness _brightness;

  const BrightnessData(this._brightness);

  bool get isDark => _brightness == Brightness.dark;
  bool get isLight => _brightness == Brightness.light;

  T by<T>({ required T light, required T dark }) {
    return isLight ? light : dark;
  }
}

class AppTheme extends CupertinoThemeData {
  const AppTheme({super.brightness, super.primaryColor});

  factory AppTheme.create() {
    BrightnessData brightness = BrightnessData(window.platformBrightness);

    return AppTheme(
        brightness: brightness._brightness,
        primaryColor: brightness.by(
          light: CupertinoColors.darkBackgroundGray,
          dark: CupertinoColors.lightBackgroundGray
        )
    );
  }
}

extension ThemeBuildContext on BuildContext {
  CupertinoThemeData get theme => CupertinoTheme.of(this);
  BrightnessData get brightness => BrightnessData(theme.brightness!);
}
