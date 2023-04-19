import 'package:english_words/english_words.dart';

class Constants {
  Constants._();

  static const String appName = 'JumpToItemListView';
  static const String root = '/';

  //Navigation routes
  static const String home = '/home';
  static const String error = '/error';

  //Images route
  static const String imageDir = "assets/images";
  static const String iconDir = "assets/icons";

  //Images
  static const String profile = "$imageDir/profile.png";

  //Icons
  static const String appIcon = "$iconDir/icon.png";

   static final List<String> wordsList = nouns.take(100).toList();
}
