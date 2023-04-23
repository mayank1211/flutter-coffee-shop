import 'package:coffe_shop/constants/app_theme.dart';
import 'package:coffe_shop/pages/cart_Page.dart';
import 'package:coffe_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.all(25),
            width: double.infinity,
            child: Center(
              child: Image.asset('assets/images/iced-tea.png'),
            ),
          ),
          const SizedBox(height: 10),
          const Text("Brew Day"),
          const SizedBox(height: 10),
          const Text("How do you like your coffee?"),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const HomePage())),
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Enter Shop",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
