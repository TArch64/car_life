import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';

class EventsGroupCell extends StatelessWidget {
  final int size;
  final Widget child;
  final Decoration? decoration;

  const EventsGroupCell({
    super.key,
    required this.size,
    required this.child,
    this.decoration,
  });

  factory EventsGroupCell.none({required int size}) {
    return EventsGroupCell(size: size, child: Container());
  }

  factory EventsGroupCell.text(String text, {required int size, Decoration? decoration}) {
    return EventsGroupCell(
      size: size,
      decoration: decoration,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(text)],
      ),
    );
  }

  static Color backgroundColor(BuildContext context) {
    return context.brightness.by(
        light: CupertinoColors.secondarySystemBackground.withOpacity(0.35),
        dark: CupertinoColors.systemBackground.withOpacity(0.1)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: size,
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    if (decoration == null) {
      return child;
    }
    return Container(
        decoration: decoration,
        child: child
    );
  }
}