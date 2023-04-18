import 'package:flutter/cupertino.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({
    super.key,
    this.navigationTitle,
    this.backgroundColor,
    required this.child,
  });

  final String? navigationTitle;
  final Color? backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var navigationBar = navigationTitle == null ? null : _buildNavigationBar();
    var navigationBarOffset = navigationBar?.preferredSize.height ?? 0;
    var screenPadding = MediaQuery.of(context).padding;

    return CupertinoPageScaffold(
      navigationBar: navigationBar,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: navigationBarOffset + screenPadding.top,
          bottom: screenPadding.bottom
        ),
        child: child,
      ),
    );
  }

  ObstructingPreferredSizeWidget _buildNavigationBar() {
    return CupertinoNavigationBar(
      middle: Text(navigationTitle!),
    );
  }
}