import 'package:flutter/cupertino.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: const [
          Positioned.fill(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
        ]
      )
    );
  }
}