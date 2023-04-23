import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Icon actionIcon;
  void Function()? onPressed;
  CoffeeTile({super.key, required this.coffee, required this.actionIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListTile(
          title: Text(coffee.name),
          subtitle: Text(coffee.price.toStringAsFixed(2)),
          leading: Image.asset(
            coffee.imagePath,
          ),
          trailing: IconButton(
            icon: actionIcon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
