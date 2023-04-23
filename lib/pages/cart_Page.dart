import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../components/list_tiles.dart';
import '../components/stripe_payment.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final PaymentController controller = Get.put(PaymentController());

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
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
                "Cart",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              if (value.userCart.isNotEmpty) ...[
                Expanded(
                  child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      Coffee eachCoffee = value.userCart[index];
                      return CoffeeTile(
                        coffee: eachCoffee,
                        actionIcon: const Icon(Icons.delete),
                        onPressed: () {
                          removeFromCart(eachCoffee);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // TODO: Add spinning circle for better ui
                              Future.delayed(
                                const Duration(seconds: 1),
                                () => Navigator.of(context).pop(true),
                              );
                              return const AlertDialog(
                                content: Text("Hello World"),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text("Total: \$${value.totalCost()}"),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // controller.makePayment();
                    controller.makePayment(
                        amount: value.totalCost(), currency: "USD");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Pay Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ] else ...[
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your cart it empty!",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}