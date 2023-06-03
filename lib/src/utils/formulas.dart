import 'package:flutter/cupertino.dart';

class Formulas {
  final double listWidth;
  final double dividerWidth;
  final BuildContext context;

  /// A class that provides methods to calculate the width of a list view, the width of the divider between items in the list view,
  /// and the width of the divider between columns in the list view.
  ///
  /// The Formulas class works by first getting the size of the screen using the MediaQuery.of(context).size.width method.
  /// Then, it calculates the width of the list view using the size / this.listWidth formula. If the listWidth is less than 1,
  /// then the width of the list view is set to the size of the screen. If the listWidth is greater than the size of the screen,
  /// then the width of the list view is set to the size of the screen.
  ///
  /// The Formulas class then calculates the width of the divider between items in the list view using the size - listWidth - dividerWidth formula.
  /// If the dividerWidth is greater than the width of the list view, then the width of the divider is set to 0.
  ///
  /// Finally, the Formulas class calculates the width of the divider between columns in the list view using the dividerWidth formula.
  /// If the dividerWidth is less than 1, then the width of the divider is set to 0.
  ///
  ///  **Parameters:**
  ///
  ///
  ///  *context:* The BuildContext of the current screen.
  ///
  ///  *listWidth:* The width of each item in the list view.
  ///
  ///  *dividerWidth:* The width of the divider between items in the list view.
  ///
  ///
  /// Returns:
  ///   A Formulas object.
  ///
  ///
  /// Example:
  ///
  ///
  ///```
  /// final formulas = Formulas(
  ///   context: context,
  ///   listWidth: 100.0,
  ///   dividerWidth: 10.0,
  /// );
  ///
  /// double w1 = formulas.w1;
  /// double w2 = formulas.w2;
  /// double d = formulas.d;
  ///
  /// print(w1); // 100.0
  /// print(w2); // 0.0
  /// print(d); // 10.0
  ///```
  ///
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
