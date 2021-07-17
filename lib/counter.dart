import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {

  late int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

