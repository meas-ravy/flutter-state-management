import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  List<String> items = [];

  int get totalCart => items.length;

  void addItem(String item) {
    items.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
