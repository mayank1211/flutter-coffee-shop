import 'package:flutter/material.dart';
import 'package:coffe_shop/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // List of coffee sale
  final List<Coffee> _shop = [
    Coffee(
      name: "latte",
      price: 4.10,
      imagePath: "assets/images/iced-tea.png",
      quantity: 1,
    ),
    Coffee(
      name: "Iced tea",
      price: 2.10,
      imagePath: "assets/images/iced-tea.png",
      quantity: 1,
    ),
    Coffee(
      name: "Chai Latte",
      price: 4.10,
      imagePath: "assets/images/iced-tea.png",
      quantity: 1,
    ),
    Coffee(
      name: "Espresso",
      price: 3.10,
      imagePath: "assets/images/iced-tea.png",
      quantity: 1,
    ),
  ];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // user cart
  List<Coffee> _userCart = [];

  // get to user cart
  List<Coffee> get userCart => _userCart;

  // remove from user cart
  void addItemToCart(Coffee coffee) {
    if (_userCart.contains(coffee)) {
      int coffeeIndex =
          _userCart.indexWhere((element) => element.name == coffee.name);

      int quantities = _userCart[coffeeIndex].quantity;

      _userCart[coffeeIndex].quantity = (quantities + 1);
    } else {
      _userCart.add(coffee);
    }
    notifyListeners();
  }

  // remove from user cart
  void removeItemQuantityFromCart(Coffee coffee) {
    if (_userCart.contains(coffee)) {
      int coffeeIndex =
          _userCart.indexWhere((element) => element.name == coffee.name);
      int quantities = _userCart[coffeeIndex].quantity;

      if (userCart[coffeeIndex].quantity > 1) {
        _userCart[coffeeIndex].quantity = (quantities - 1);
      }
    }
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  // reset user cart
  void emptyUserCart() {
    _userCart = [];
    notifyListeners();
  }

  // add total price in cart
  double totalCost() {
    double totalCost = 0.0;

    for (var coffee in _userCart) {
      totalCost = totalCost + (coffee.price * coffee.quantity);
    }
    return totalCost;
  }
}
