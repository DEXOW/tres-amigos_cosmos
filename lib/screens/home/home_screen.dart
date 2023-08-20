import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

String selectedPlanet = 'Earth';

Widget buildAttractionsItem(IconData icon, String title) {
  return Container(
    width: double.infinity,
    height: 45,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: const Color(0x7FD9D9D9),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF191E22),
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Color(0xFF191E22),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: List.generate(
            5,
            (index) => const Icon(
              Icons.star_rate_rounded,
              color: Color(0xFF191E22),
              size: 20,
            ),
          ),
        ),
      ],
    ),
  );
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

class HomeScreenState extends State<HomeScreen> {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      'Handpicked Collections For You',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
                    height: 7.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 30, top: 40, bottom: 40, right: 30),
                    child: Text(
                      'Find the best places for you to visit at the most affordable prices',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xFFEBE0E0),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
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
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (selectedPlanet == 'Earth') {
                            return buildPlanetDisplay(
                                'Earth', 'assets/images/Earth.png');
                          } else if (selectedPlanet == 'Jupiter') {
                            return buildPlanetDisplay(
                                'Jupiter', 'assets/images/Jupiter.png');
                          } else if (selectedPlanet == 'Mars') {
                            return buildPlanetDisplay(
                                'Mars', 'assets/images/Mars.png');
                          } else if (selectedPlanet == 'Mercury') {
                            return buildPlanetDisplay(
                                'Mercury', 'assets/images/Mercury.png');
                          } else if (selectedPlanet == 'Neptune') {
                            return buildPlanetDisplay(
                                'Neptune', 'assets/images/Neptune.png');
                          } else if (selectedPlanet == 'Saturn') {
                            return buildPlanetDisplay(
                                'Saturn', 'assets/images/Saturn.png');
                          } else if (selectedPlanet == 'Uranus') {
                            return buildPlanetDisplay(
                                'Uranus', 'assets/images/Uranus.png');
                          } else if (selectedPlanet == 'Venus') {
                            return buildPlanetDisplay(
                                'Venus', 'assets/images/Venus.png');
                          }
                          return Container();
                        },
                      ),
                      Positioned(
                        left: 5,
                        top: 45,
                        child: buildchangePlanetButton(
                          7.5,
                          Icons.arrow_back_ios,
                          () {
                            setState(
                              () {
                                List<String> planets = [
                                  'Earth',
                                  'Venus',
                                  'Mercury',
                                  'Neptune',
                                  'Uranus',
                                  'Saturn',
                                  'Jupiter',
                                  'Mars'
                                ];
                                int currentIndex =
                                    planets.indexOf(selectedPlanet);
                                    // print(currentIndex);
                                selectedPlanet = planets[
                                    (currentIndex + 1) % planets.length];
                              },
                            );
                          },
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 45,
                        child: buildchangePlanetButton(
                          0,
                          Icons.arrow_forward_ios,
                          () {
                            setState(
                              () {
                                List<String> planets = [
                                  'Earth',
                                  'Venus',
                                  'Mercury',
                                  'Neptune',
                                  'Uranus',
                                  'Saturn',
                                  'Jupiter',
                                  'Mars'
                                ];
                                int currentIndex =
                                    planets.indexOf(selectedPlanet);
                                    // print(currentIndex);
                                selectedPlanet = planets[
                                    (currentIndex - 1) % planets.length];
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    height: 240,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0x40000000),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 18),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFF404C57),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star_outline_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Attractions',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 72,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFF404C57),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.cloud_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 72,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFF404C57),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.people_alt_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        buildAttractionsItem(
                            Icons.house_outlined, 'Eiffel Tower'),
                        const SizedBox(
                          height: 12,
                        ),
                        buildAttractionsItem(
                            Icons.house_outlined, 'Eiffel Tower'),
                        const SizedBox(
                          height: 12,
                        ),
                        buildAttractionsItem(
                            Icons.house_outlined, 'Eiffel Tower'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0x25FFFFFF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "assets/icons/home.svg",
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/seach.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/booking.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
