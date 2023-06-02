import 'package:flutter/cupertino.dart';

class Formulas {
  final double listWidth;
  final double dividerWidth;
  final BuildContext context;

  const Formulas({
    required this.context,
    required this.listWidth,
    required this.dividerWidth,
  });

  double get w1 => _w1();

  double get w2 => _w2();

  double get d => _d();

  double _w1() {
    double size = MediaQuery.of(context).size.width;
    double listWidth = size / this.listWidth;
    if (this.listWidth < 1 || listWidth > size || listWidth < 0) {
      return size;
    }
    return listWidth;
  }

  double _w2() {
    double size = MediaQuery.of(context).size.width;
    double listWidth = size / this.listWidth;
    /*double numerator = size * this.listWidth;
    double denominator = numerator - (dividerWidth * this.listWidth) - size;
    double w2 = size / (numerator / denominator);*/
    double w2 = size - listWidth - dividerWidth;
    if (dividerWidth > (size - listWidth).abs()) {
      return (size - listWidth).abs();
    }
    if (w2 > size || w2 < 0) {
      return 0;
    }
    return w2;
  }

  double _d() {
    double size = MediaQuery.of(context).size.width;
    double listWidth = size / this.listWidth;
    if (dividerWidth > listWidth || dividerWidth > size || dividerWidth < 1) {
      return 0;
    }
    if (listWidth < 1 || listWidth > size || listWidth < 0) {
      return 0;
    }
    if (dividerWidth > (size - listWidth).abs()) {
      return 0;
    }
    return dividerWidth;
  }

}
