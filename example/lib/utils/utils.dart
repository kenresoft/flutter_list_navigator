import 'dart:developer' as print;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

/// Displays a toast message using the provided [context] and [msg].
///
/// The [msg] parameter can be of any data type and will be converted to a string.
/// This function utilizes the [ScaffoldMessenger] to show a [SnackBar] with the [msg] as its content.
///
/// Example:
///
/// ```dart
/// toast(context, 'Hello, world!');
/// ```
void toast(BuildContext context, dynamic msg) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg.toString(),
          style: const TextStyle(
            backgroundColor: Colors.black54,
            color: CupertinoColors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

/// An extension on [Object] to provide a simple logging mechanism.
///
/// This extension adds a [log] method to all objects, allowing them to be easily printed to the console.
extension Logger on Object {
  /// Prints the string representation of the object to the console.
  ///
  /// Example:
  ///
  /// ```dart
  /// 'Hello, world!'.log(); // Prints: Hello, world!
  /// ```
  void log() {
    print.log(toString());
  }
}
