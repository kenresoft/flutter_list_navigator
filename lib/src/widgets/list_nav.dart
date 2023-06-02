import 'package:flutter/cupertino.dart';

import 'list_navigator.dart';

class ListNav extends ListNavigator {
  ListNav({
    this.navigatorClick,
    required this.navigatorWidth,
    required this.navigatorDividerWidth,
    required this.navigatorBuilder,
    this.navigatorDecoration,
    super.key,
  }) : super(
          list: [],
          listItemWidth: navigatorWidth,
          dividerWidth: navigatorDividerWidth,
          onItemClick: navigatorClick,
          itemBuilder: navigatorBuilder,
          navDecoration: navigatorDecoration,
        );

  final void Function(int itemKey)? navigatorClick;
  final double navigatorWidth;
  final double navigatorDividerWidth;
  final Widget Function(BuildContext context, int index, String item) navigatorBuilder;
  final BoxDecoration? navigatorDecoration;
}
