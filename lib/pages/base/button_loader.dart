import 'package:flutter/cupertino.dart';

class ButtonLoader extends StatefulWidget {
  final bool visible;
  final Color color;
  final Widget child;

  const ButtonLoader({
    super.key,
    required this.visible,
    required this.child,
    required this.color
  });

  @override
  State<ButtonLoader> createState() => _ButtonLoaderState();
}

class _ButtonLoaderState extends State<ButtonLoader> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: widget.visible,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: CupertinoActivityIndicator(
              color: widget.color,
            ),
          ),
        ),
        widget.child
      ]
    );
  }
}