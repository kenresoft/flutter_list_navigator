import 'dart:developer' as print;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

toast(BuildContext context, dynamic msg) => ScaffoldMessenger.of(context).showSnackBar(
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

extension Logger on Object {
  log() {
    print.log(toString());
  }
}
