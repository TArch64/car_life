import 'package:flutter/cupertino.dart';

class AppTheme extends CupertinoThemeData {
  const AppTheme(): super(
      primaryColor: CupertinoColors.darkBackgroundGray
  );
}

extension ThemedBuildContext on BuildContext {
  CupertinoThemeData get theme => CupertinoTheme.of(this);
}
