import 'package:flutter/material.dart';
import 'package:flutter_list_navigator/src/providers/index_provider.dart';
import 'package:flutter_list_navigator/src/utils/formulas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/list_nav.dart';
import 'widgets/list_navigator.dart';

typedef ListItemClick = Function(String listItem, int listItemIndex);

class JumpingListView extends ConsumerStatefulWidget {
  const JumpingListView({
    Key? key,
    required this.list,
    required this.itemExtent,
    required this.jumpAnimationDuration,
    required this.jumpAnimationCurve,
    required this.itemBuilder,
    required this.listNavigator,
    this.onNavigatorClick,
  }) : super(key: key);

  final List<String> list;
  final double itemExtent;
  final Duration jumpAnimationDuration;
  final Curve jumpAnimationCurve;
  final ListNav listNavigator;
  final GestureTapCallback? onNavigatorClick;

  ///
  /// 'position' is the position of the list item in the entire list length.
  final Widget? Function(BuildContext context, int index, String item, double position) itemBuilder;

  @override
  ConsumerState<JumpingListView> createState() => _JumpingListViewState();
}

class _JumpingListViewState extends ConsumerState<JumpingListView> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(indexProvider.select((value) => value));
    final itemExtent = widget.itemExtent + 8;
    final position = (index) * (itemExtent);
    scrollController.animateTo(position, duration: widget.jumpAnimationDuration, curve: widget.jumpAnimationCurve);
    final formula = Formulas(context: context, listWidth: widget.listNavigator.listItemWidth, dividerWidth: widget.listNavigator.dividerWidth);

    return Row(
      children: [
        SizedBox(
          width: formula.w1,
          child: ListView.builder(
            controller: scrollController,
            itemCount: widget.list.length,
            itemExtent: itemExtent,
            itemBuilder: (BuildContext context, int index) {
              return widget.itemBuilder(context, index, widget.list[index], position)!;
            },
          ),
        ),
        SizedBox(width: formula.d),
        ListNavigator(
          list: widget.list,
          dividerWidth: widget.listNavigator.dividerWidth,
          listItemWidth: widget.listNavigator.listItemWidth,
          onItemClick: (key) {
            ref.watch(indexProvider.notifier).increment(key);
            if (widget.listNavigator.onItemClick != null) {
              widget.listNavigator.onItemClick!(key);
            }
          },
          navDecoration: widget.listNavigator.navigatorDecoration,
          itemBuilder: (BuildContext context, int itemKey, String itemValue) {
            return widget.listNavigator.navigatorBuilder(context, itemKey, itemValue);
          },
        ),
      ],
    );
  }
}
