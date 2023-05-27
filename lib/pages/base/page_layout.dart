import 'package:flutter/cupertino.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({
    super.key,
    this.navigationTitle,
    this.backTitle,
    this.navigationAppend,
    this.inlineNavigationTitle = false,
    this.backgroundColor,
    this.bottomScreenSafeOffset = true,
    required this.child,
  });

  final String? navigationTitle;
  final String? backTitle;
  final bool inlineNavigationTitle;
  final Widget? navigationAppend;
  final Color? backgroundColor;
  final bool bottomScreenSafeOffset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var navigationBar = _buildNavigationBar();
    var navigationBarOffset = navigationBar?.preferredSize.height ?? 0;
    var inlineNavigationTitle = _buildInlineNavigationTitle(context);
    var screenPadding = MediaQuery.of(context).padding;
    return CupertinoPageScaffold(
      navigationBar: navigationBar,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenPadding.top + navigationBarOffset,
          bottom: bottomScreenSafeOffset ? screenPadding.bottom : 0,
        ),
        child: inlineNavigationTitle == null ? child : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [inlineNavigationTitle, child],
        ),
      ),
    );
  }

  ObstructingPreferredSizeWidget? _buildNavigationBar() {
    if (navigationTitle == null) return null;
    if (inlineNavigationTitle) return null;
    return CupertinoNavigationBar(
      middle: Text(navigationTitle!),
      previousPageTitle: backTitle,
      trailing: navigationAppend
    );
  }

  Widget? _buildInlineNavigationTitle(BuildContext context) {
    if (navigationTitle == null) return null;
    if (!inlineNavigationTitle) return null;
    var theme = CupertinoTheme.of(context).textTheme;
    var style = theme.navLargeTitleTextStyle.copyWith(
      fontSize: theme.navLargeTitleTextStyle.fontSize! - 5,
    );
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Text(navigationTitle!, style: style),
    );
  }
}