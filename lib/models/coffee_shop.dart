import 'dart:ffi';

import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // List of coffee sale
  final List<Coffee> _shop = [
    Coffee(
        name: "latte", 
        price: 4.10, 
        imagePath: "assets/images/iced-tea.png"),
    Coffee(
        name: "Iced tea",
        price: 2.10,
        imagePath: "assets/images/iced-tea.png"),
    Coffee(
        name: "Chai Latte",
        price: 4.10,
        imagePath: "assets/images/iced-tea.png"),
    Coffee(
        name: "Espresso",
        price: 3.10,
        imagePath: "assets/images/iced-tea.png"),
  ];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // user cart
  final List<Coffee> _userCart = [];

  // get to user cart
  List<Coffee> get userCart => _userCart;

  // remove from user cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove from user cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  String totalCost() {
    double totalCost = 0.0;

    for (var coffee in _userCart) {
      totalCost += coffee.price;
    }
    return totalCost.toStringAsFixed(0);
  }
}
