import 'package:flutter/cupertino.dart';
import 'package:car_life/core/localization.dart';

class Confirm extends StatelessWidget {
  static Future<bool> ask({
    required BuildContext context,
    required String title,
    required String question,
    required String acceptTitle,
    required String dismissTitle,
  }) async {
    final result = await showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) => Confirm(
        title: title,
        question: question,
        acceptTitle: acceptTitle,
        dismissTitle: dismissTitle,
      ),
    );
    return result ?? false;
  }

  static Future<bool> askDelete(BuildContext context, String name) {
    return ask(
      context: context,
      title: context.l10n.confirmDeleteTitle,
      question: context.l10n.confirmDeleteQuestion(name),
      acceptTitle: context.l10n.confirmDeleteAction,
      dismissTitle: context.l10n.confirmDeleteCancelAction
    );
  }

  final String title;
  final String question;
  final String acceptTitle;
  final String dismissTitle;

  const Confirm({
    super.key,
    required this.title,
    required this.question,
    required this.acceptTitle,
    required this.dismissTitle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(question),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context, false),
          child: Text(dismissTitle),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(context, true),
          child: Text(acceptTitle),
        ),
      ],
    );
  }
}