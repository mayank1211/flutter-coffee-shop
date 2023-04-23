import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
        bottom: false,
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
                        isCartPage: true,
                        onPressed: () {
                          removeFromCart(eachCoffee);
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
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child:
                      Text("Total: \$${value.totalCost().toStringAsFixed(2)}"),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    await controller.makePayment(value.totalCost(), 'GBP');
                    await controller.displayPaymentSheet();
                    value.emptyUserCart();
                    // TODO:
                    // New payment confirmation page
                    // Add separate page for coffee quantity and sizes
                    // Redirect the useer back to shop page
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
