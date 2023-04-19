import 'package:car_life/localization.dart';
import 'package:flutter/cupertino.dart';

import '../../base/page_layout.dart';
import 'add_car_form.dart';

class AddCarPage extends StatelessWidget {
  const AddCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.addCarNavigationTitle,
      inlineNavigationTitle: true,
      backgroundColor: CupertinoColors.secondarySystemBackground,
      child: const AddCarForm()
    );
  }
}