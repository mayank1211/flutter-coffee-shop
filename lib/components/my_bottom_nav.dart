import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (value) => onTabChange!(value),
      mainAxisAlignment: MainAxisAlignment.center,
      haptic: true,
      color: Colors.grey[800], // unselected icon color
      activeColor: Colors.grey.shade700, // selected icon and text color
      tabBackgroundColor: Colors.grey.shade700.withOpacity(0.1),
      tabMargin: const EdgeInsets.only(bottom: 25),
      gap: MediaQuery.of(context).size.width * 0.02,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Shop',
        ),
        GButton(
          icon: Icons.shopping_bag,
          text: 'Cart',
        )
      ],
    );
  }
}
