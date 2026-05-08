import 'package:flutter/foundation.dart';

class CounterApp extends ChangeNotifier {
  int counter = 0;

  void increment() {
    if (counter < 20) {
      counter++;
    }
    notifyListeners();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }
}
