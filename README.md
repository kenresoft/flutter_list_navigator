<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

flutter_list_navigator (Jump to Item) Flutter Package which contains a navigator that can be used to jump to a particular index of a list.

## Features

- Both the main ListView and the controlling/navigator ListView are fully Customizable.
- The ListView navigates with an Animation which can be changed at will.
- The builder functions provide callback functions that can be of help.
- The space between the main List and the navigator list can be specified.
- The width of the navigator can as well be specified.

### Screenshot

<video alt="flutter_list_navigator example application" height="500" src="https://github.com/kenresoft/flutter_list_navigator/blob/master/example/screenshots/screen-record.mp4" title="ScreenRecord" width="250"/></video>

## Getting started

To use this package :

* add the dependency to your [pubspec.yaml](/pubspec.yaml) file.

### Dependency

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_list_navigator:
    git:
      url: git@github.com:kenresoft/flutter_list_navigator.git
      ref: master
```

## Usage

Below is how this package can be use.

<details>
<summary>

[Example Project](/example/lib/main.dart)

</summary>

```dart

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
                onTap: () => toast("$index - $item"),
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
                        style: const TextStyle(fontSize: 45, fontStyle: FontStyle.italic),
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
```

</details>

## Additional information

The Ui contains just three sections:

- The main ListView
- The divider
- The navigator list

Only the list needs to be specified by the user, these 3 UIs are automatically handled with the right dimensions.

For example, the user should pass a constant list to the list argument.

```dart

const List<String> myList = ["Hello", "Flutter", "Dart", "Package"];
```

this can then be passed to the [JumpingListView]

```dart

Widget jlv = JumpingListView(
  list: myList,
  /*...*/
);
```

Feel free to contribute to this package or notify us of any issues found.
Thank you.
