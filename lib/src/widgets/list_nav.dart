import 'package:flutter/cupertino.dart';

import 'list_navigator.dart';

class ListNav extends ListNavigator {
  /// A widget that extends the ListNavigator widget and adds a navigatorClick callback function.
  ///
  /// The ListNav widget takes the same arguments as the ListNavigator widget, but it also takes an additional argument called navigatorClick. The navigatorClick argument is a callback function that is called when the user taps on an item in the list view.
  ///
  /// Parameters:
  ///   navigatorClick: A callback function that is called when the user taps on an item in the list view.
  ///   navigatorWidth: The width of the list view.
  ///   navigatorDividerWidth: The width of the divider between items in the list view.
  ///   navigatorBuilder: A function that is called to create each item in the list view. The function takes three arguments: the BuildContext, the index of the item in the list view, and the value of the item in the list view.
  ///   navigatorDecoration: An optional decoration to apply to the list view.
  ///
  /// Returns:
  ///   A ListNav widget.
  ///
  /// Example:
  ///
  ///
  ///
  ///```
  /// final list = ["foo", "bar", "baz"];
  ///
  /// Widget build(BuildContext context) {
  ///   return ListNav(
  ///     list: list,
  ///     navigatorClick: (index) {
  ///       print("You tapped on item $index");
  ///     },
  ///     navigatorWidth: 100.0,
  ///     navigatorDividerWidth: 10.0,
  ///     navigatorBuilder: (context, index, value) {
  ///       return Text(value);
  ///     },
  ///   );
  /// }
  ///```
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
