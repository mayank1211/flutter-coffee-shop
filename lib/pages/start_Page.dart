import 'package:coffe_shop/constants/app_theme.dart';
import 'package:coffe_shop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Text(
            "Brew Day",
            style: GoogleFonts.montserrat(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "How do you like your coffee?",
            style: GoogleFonts.montserrat(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.w400
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage())),
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "Enter Shop",
                  style: GoogleFonts.montserrat(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
