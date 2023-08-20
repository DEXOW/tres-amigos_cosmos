import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => TestScreenState();
}

Widget buildPlanetDisplay(String planetName, String planetImage) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            planetName,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xFFEBE0E0),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Image(
          image: AssetImage(planetImage),
          height: 80,
          width: 80,
        ),
      ],
    ),
  );
}

Widget buildchangePlanetButton(
    double leftPadding, IconData icon, Function() onPressed) {
  return IconButton(
    padding: EdgeInsets.zero,
    icon: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding),
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
    ),
    onPressed: () {
      onPressed();
    },
  );
}

class TestScreenState extends State<TestScreen> {
  final List<String> planets = [
    'Earth',
    'Jupiter',
    'Mars',
    'Mercury',
    'Neptune',
    'Saturn',
    'Uranus',
    'Venus',
  ];
  int currentPlanetIndex = 0;

  void changePlanet(bool goForward) {
    setState(() {
      if (goForward) {
        currentPlanetIndex = (currentPlanetIndex + 1) % planets.length;
      } else {
        currentPlanetIndex = (currentPlanetIndex - 1) % planets.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 140,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: Color(0xFF5C6166)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      top: 45,
                      child: buildchangePlanetButton(
                          7.5, Icons.arrow_back_ios, () => changePlanet(false)),
                    ),
                    Positioned(
                      right: 5,
                      top: 45,
                      child: buildchangePlanetButton(7.5,
                          Icons.arrow_forward_ios, () => changePlanet(true)),
                    ),
                    // AnimatedSwitcher with unique key
                    buildPlanetDisplay(
                      planets[currentPlanetIndex],
                      'assets/images/${planets[currentPlanetIndex]}.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
