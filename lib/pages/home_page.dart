import 'package:coffe_shop/constants/app_theme.dart';
import 'package:coffe_shop/pages/Cart_Page.dart';
import 'package:flutter/material.dart';

import '../components/my_bottom_nav.dart';
import 'Shop_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.all(70),
              child: Image.asset('assets/images/iced-tea.png'),
            ),
            const ListTile(leading: Icon(Icons.exit_to_app), title: Text('Logout')),
            const ListTile(leading: Icon(Icons.exit_to_app), title: Text('Logout')),
            const Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                  leading: Icon(Icons.exit_to_app), title: Text('Logout')),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
