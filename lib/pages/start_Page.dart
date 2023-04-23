import 'package:coffe_shop/constants/Colors.dart';
import 'package:coffe_shop/pages/cart_Page.dart';
import 'package:coffe_shop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Shop_Page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(25),
            width: double.infinity,
            child: Center(
              child: Image.asset('assets/images/iced-tea.png'),
            ),
          ),
          SizedBox(height: 10),
          Text("Brew Day"),
          SizedBox(height: 10),
          Text("How do you like your coffee?"),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage())),
            child: Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.all(25),
              width: double.infinity,
              child: Center(
                child: Text(
                  "Enter Shop",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
