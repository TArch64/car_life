import 'package:flutter/cupertino.dart';
import 'package:car_life/core/theme.dart';

class EventsGroupCell extends StatelessWidget {
  final int size;
  final Widget child;
  final bool highlight;

  const EventsGroupCell({
    super.key,
    required this.size,
    required this.child,
    required this.highlight,
  });

  factory EventsGroupCell.placeholder({required int size, required bool highlight}) {
    return EventsGroupCell(size: size, highlight: highlight, child: Container());
  }

  factory EventsGroupCell.text(String text, { required int size, required bool highlight }) {
    return EventsGroupCell(
      size: size,
      highlight: highlight,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(text)],
      ),
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
    if (!highlight) {
      return child;
    }
    return Container(
        decoration: BoxDecoration(color: _cellBackgroundColor(context)),
        child: child
    );
  }

  Color _cellBackgroundColor(BuildContext context) {
    return context.brightness.by(
        light: CupertinoColors.secondarySystemBackground.withOpacity(0.35),
        dark: CupertinoColors.systemBackground.withOpacity(0.1)
    );
  }
}