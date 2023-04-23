import 'package:car_life/core/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:car_life/pages/base/page_layout.dart';

import '../events_group_data.dart';

class AddEventPage extends StatelessWidget {
  final EventsGroupData  focusedGroupData;

  const AddEventPage({
    super.key,
    required this.focusedGroupData
  });

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      navigationTitle: context.l10n.addEventNavigationTitle,
      child: Text("test")
    );
  }
}