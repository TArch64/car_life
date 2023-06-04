import 'package:flutter/cupertino.dart';

import 'core/localization.dart';
import 'core/theme.dart';

class ApplicationWrapper extends StatelessWidget {
  final Widget child;

  const ApplicationWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'CarLife',
      theme: AppTheme.create(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  }
}
