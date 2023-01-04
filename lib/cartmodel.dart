import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avocado', '4.00', 'lib/images/avocado.png', Colors.green],
    ['Banana', '2.50', 'lib/images/banana.png', Colors.yellow],
    ['Chicken', '12.80', 'lib/images/chicken.png', Colors.brown],
    ['Water', '1.00', 'lib/images/water.png', Colors.blue],
  ];

  // list of CArt items
  final List _cartItems = [];

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    Get.snackbar(
      'Item Added',
      shopItems[index][0] + ' has been added to Cart',
      duration: const Duration(milliseconds: 650),
    );
    notifyListeners();
  }

  //remove item from cart
  void removeItemToCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calulate total
  String calculateTotal() {
    var total = 0.0;
    for (var item in _cartItems) {
      total += double.parse(item[1]);
    }
    return total.toStringAsFixed(2);
  }

  get cartItems => _cartItems;
  get shopItems => _shopItems;
}
