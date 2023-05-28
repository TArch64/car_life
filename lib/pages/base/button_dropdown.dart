import 'package:flutter/cupertino.dart';

class ButtonDropdownAction extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isDestructiveAction;

  const ButtonDropdownAction({
    super.key,
    required this.child,
    required this.onPressed,
    this.isDestructiveAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      isDestructiveAction: isDestructiveAction,
      onPressed: () {
        Navigator.pop(context);
        onPressed();
      },
      child: child
    );
  }
}

class ButtonDropdown extends StatelessWidget {
  final Widget child;
  final List<Widget> actions;
  final EdgeInsets? padding;

  const ButtonDropdown({
    super.key,
    required this.child,
    required this.actions,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      onPressed: () => _openDropdown(context),
      child: child,
    );
  }

  _openDropdown(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: actions,
      ),
    );
  }
}
