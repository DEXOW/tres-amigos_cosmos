import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

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
  int currentPlanetIndex = 0;
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
                      Positioned(
                        left: 5,
                        top: 45,
                        child: buildchangePlanetButton(7.5,
                            Icons.arrow_back_ios, () => changePlanet(false)),
                      ),
                      Positioned(
                        right: 5,
                        top: 45,
                        child: buildchangePlanetButton(0,
                            Icons.arrow_forward_ios, () => changePlanet(true)),
                      ),
                      // AnimatedSwitcher with unique key
                      buildPlanetDisplay(
                        planets[currentPlanetIndex],
                        'assets/images/${planets[currentPlanetIndex]}.png',
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('Tapped');
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 10, right: 18),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF404C57),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star_outline_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 6),
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
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  // width: 70,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF404C57),
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
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  // width: 70,
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
              color: const Color(0x25FFFFFF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                Widget buildIcon(String iconPathSVG) {
                  return IconButton(
                    icon: SvgPicture.asset(
                      iconPathSVG,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    onPressed: () {},
                  );
                }
                Widget buildSelectedIcon(String iconPathSVG) {
                  return IconButton(
                    padding: EdgeInsets.zero,
                    icon: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        iconPathSVG,
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                      ),
                    ),
                    onPressed: () {},
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSelectedIcon("assets/icons/home.svg"),
                    buildIcon("assets/icons/seach.svg"),
                    buildIcon("assets/icons/booking.svg"),
                    buildIcon("assets/icons/profile.svg"),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}