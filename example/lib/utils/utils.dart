import 'dart:developer' as print;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toast(dynamic msg) => Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: CupertinoColors.white,
      fontSize: 18,
    );

extension Logger on Object {
  log() {
    print.log(toString());
  }
}
