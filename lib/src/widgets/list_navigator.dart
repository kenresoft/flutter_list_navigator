import 'package:flutter/cupertino.dart';
import 'package:flutter_list_navigator/src/utils/utils.dart';

import '../utils/formulas.dart';


class ListNavigator extends StatelessWidget {
  const ListNavigator({
    Key? key,
    required this.list,
    this.onItemClick,
    required this.listItemWidth,
    required this.dividerWidth,
    required this.itemBuilder,
    this.navDecoration,
  }) : super(key: key);

  final List<String> list;
  final void Function(int)? onItemClick;
  final double listItemWidth;
  final double dividerWidth;
  final Widget Function(BuildContext context, int itemKey, String itemValue) itemBuilder;
  final BoxDecoration? navDecoration;

  @override
  Widget build(BuildContext context) {
    final formula = Formulas(context: context, listWidth: listItemWidth, dividerWidth: dividerWidth);
    return Container(
      decoration: navDecoration,
      width: formula.w2,
      child: ListView.builder(
        itemCount: list.ids.length,
        itemBuilder: (BuildContext context, int index2) {
          var sortedListKeys = list.ids.keys.toList()[index2];
          var sortedListValues = list.ids.values.toList()[index2];
          return GestureDetector(
              onTap: () {
                if (onItemClick != null) {
                  onItemClick!(sortedListKeys);
                }
              },
              child: itemBuilder(context, sortedListKeys, sortedListValues));
        },
      ),
    );
  }
}
