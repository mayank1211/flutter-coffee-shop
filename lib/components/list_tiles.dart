import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';

class CoffeeTile extends StatefulWidget {
  final Coffee coffee;
  final Icon actionIcon;
  final bool isCartPage;
  void Function()? onPressed;
  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.actionIcon,
      required this.onPressed,required this.isCartPage});

  @override
  State<CoffeeTile> createState() => _CoffeeTileState();
}

class _CoffeeTileState extends State<CoffeeTile> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
  }

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListTile(
          title: Text(widget.coffee.name),
          subtitle: Text("\$${widget.coffee.price.toStringAsFixed(2)}"),
          leading: Image.asset(
            widget.coffee.imagePath,
          ),
          trailing: Wrap(
            children: <Widget>[
              if (widget.isCartPage) ...[
                CounterButton(
                loading: false,
                onChange: (int val) => val > widget.coffee.quantity
                    ? addToCart(widget.coffee)
                    : removeFromCart(widget.coffee),
                count: widget.coffee.quantity,
              ),
              ],
              IconButton(
                icon: widget.actionIcon,
                onPressed: widget.onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
