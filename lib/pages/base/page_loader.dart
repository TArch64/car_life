import 'package:flutter/cupertino.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ]
    );
  }
}