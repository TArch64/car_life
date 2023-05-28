import 'package:car_life/core/localization.dart';
import 'package:flutter/cupertino.dart';

class Alert extends StatelessWidget {
  static showError({ required BuildContext context, String? text }) {
    show(
      context: context,
      title: context.l10n.alertTitleError,
      text: text ?? context.l10n.alertCommonError
    );
  }

  static show({
    required BuildContext context,
    required String title,
    required String text
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) => Alert(
        title: title,
        text: text,
      ),
    );
  }

  final String title;
  final String text;

  const Alert({
    super.key,
    required this.title,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: Text(context.l10n.alertOk),
        )
      ],
    );
  }
}
