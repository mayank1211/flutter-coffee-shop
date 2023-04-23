import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../components/list_tiles.dart';
import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How do you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeeShop[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      actionIcon: const Icon(Icons.add),
                      isCartPage: false,
                      onPressed: () {
                        addToCart(eachCoffee);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(
                              const Duration(milliseconds: 1500),
                              () => Navigator.of(context).pop(true),
                            );
                            return LoadingAnimationWidget.inkDrop(
                              color: Colors.white,
                              size: 50,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
