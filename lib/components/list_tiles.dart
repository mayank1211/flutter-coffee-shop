import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:coffe_shop/models/coffee.dart';

class CoffeeTile extends StatefulWidget {
  final Coffee coffee;
  final Icon actionIcon;
  final bool isCartPage;
  void Function()? onPressed;
  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.actionIcon,
      required this.onPressed,
      required this.isCartPage});

  @override
  State<CoffeeTile> createState() => _CoffeeTileState();
}

class _CoffeeTileState extends State<CoffeeTile> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
  }

  void removeItemQuantityFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false)
        .removeItemQuantityFromCart(coffee);
  }

  void removeItemFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListTile(
          title: Text(
            widget.coffee.name,
            style: GoogleFonts.montserrat(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text(
            "\$${widget.coffee.price.toStringAsFixed(2)}",
            style: GoogleFonts.montserrat(
                fontSize: MediaQuery.of(context).size.width * 0.035, fontWeight: FontWeight.w400),
          ),
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
                      : removeItemQuantityFromCart(widget.coffee),
                  count: widget.coffee.quantity,
                ),
              ],
              IconButton(icon: widget.actionIcon, onPressed: widget.onPressed),
            ],
          ),
        ),
      ),
    );
  }
}
