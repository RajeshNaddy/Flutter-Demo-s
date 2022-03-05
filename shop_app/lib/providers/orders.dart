import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get items {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double amount) {
    _orders.insert(0,
        OrderItem(DateTime.now().toString(), amount, products, DateTime.now()));
    notifyListeners();
  }
}

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(this.id, this.amount, this.products, this.dateTime);
}
