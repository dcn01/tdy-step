import 'package:flutter/material.dart';

class Store with ChangeNotifier {
  var _count1 = 0, _count2 = 0;

  get count1 => _count1;
  set count1(val) {
    _count1 = val;
    notifyListeners();
  }

  get count2 => _count2;
  set count2(val) {
    _count2 = val;
    notifyListeners();
  }
}
