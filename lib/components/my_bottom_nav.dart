import 'package:coffe_shop/pages/Cart_Page.dart';
import 'package:coffe_shop/pages/Shop_Page.dart';

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
      // haptic: true, // haptic feedback
      color: Colors.grey[800], // unselected icon color
      activeColor: Colors.grey.shade700, // selected icon and text color
      tabBackgroundColor: Colors.grey.shade700.withOpacity(0.1),
      tabMargin: EdgeInsets.only(bottom: 25),
      gap: 10,
      tabs: [
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
