import 'dart:core';
import 'dart:developer' as print;

extension ListExtension<T> on List<T> {
  Map<int, String> _ids() {
    List<int> ind = [];
    Map<int, String> mp = {};
    var alp = 'a';
    if (this is List<String>) {
      for (var i = 0; i < length; ++i) {
        var o = this[i].toString().toUpperCase();
        if (o[0] != alp) {
          ind.add(i);
          alp = o[0];
          mp.update(i, (value) => value, ifAbsent: () => alp);
        }
      }
      return mp;
    } else {
      return mp;
    }
  }

  Map<int, String> get ids => _ids();
}

extension Logger on Object {
  log() {
    print.log(toString());
  }
}
