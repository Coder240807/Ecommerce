import 'package:flutter/material.dart';
import 'package:ecommerceapp/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart extends ChangeNotifier {
  final List<CartItem> items = [];

  int get count => items.fold(0, (sum, item) => sum + item.quantity);

  double get total =>
      items.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);

  void add(Product product, {int quantity = 1}) {
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      items.add(CartItem(product: product, quantity: quantity));
    } else {
      items[index].quantity += quantity;
    }
    notifyListeners();
  }

  void increase(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrease(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      items.remove(item);
    }
    notifyListeners();
  }

  void remove(CartItem item) {
    items.remove(item);
    notifyListeners();
  }
}

final cart = Cart();
