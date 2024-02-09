import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_navigator/flutter_list_navigator.dart';

import '../data/constants/constants.dart';
import '../utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var mainList = Constants.wordsList.multiply(times: 1, sort: true);
    (mainList.ids.toString()).log;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeGreen,
        brightness: Brightness.dark,
        middle: Text(Constants.appName),
        border: Border(bottom: BorderSide(width: 2, color: CupertinoColors.systemGrey2)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: JumpingListView(
            list: mainList,
            itemExtent: 97,
            jumpAnimationDuration: const Duration(milliseconds: 700),
            jumpAnimationCurve: Curves.easeInOut,
            itemBuilder: (context, index, item, position) {
              return GestureDetector(
                onTap: () => toast(context, "$index - $item"),
                child: Card(
                  margin: const EdgeInsets.all(10),
                  color: CupertinoColors.systemFill,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: CupertinoColors.systemGrey, width: 5, strokeAlign: 1),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Column(children: [
                      const FlutterLogo(size: 30),
                      Text(
                        item,
                        style: const TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.left,
                      ),
                    ]),
                  ),
                ),
              );
            },
            listNavigator: ListNav(
              navigatorWidth: 1.25,
              navigatorDividerWidth: 1,
              navigatorClick: (index) {},
              navigatorDecoration: const BoxDecoration(color: CupertinoColors.darkBackgroundGray),
              navigatorBuilder: (BuildContext context, int index, String item) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 35,
                    alignment: Alignment.center,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: CupertinoColors.activeOrange),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
