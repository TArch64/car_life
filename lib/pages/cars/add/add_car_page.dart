import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:car_life/pages/base/page_layout.dart';
import 'package:flutter/cupertino.dart';

import 'add_car_form.dart';

class AddCarPage extends StatelessWidget {
  const AddCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: AppLocalizations.of(context)!.addCarNavigationTitle,
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: const AddCarForm()
    );
  }
}