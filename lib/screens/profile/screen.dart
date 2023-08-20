import 'package:cosmos/screens/components/animated_star_background.dart';
import 'package:cosmos/screens/components/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedStarBackground(screenHeight: screenHeight, screenWidth: screenWidth),
            Positioned(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    const SizedBox(height: 100),
                    // Profile picture and name
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                        // SizedBox to create space between profile picture and text

                        // Text below the profile picture
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'AryaMuller',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'arya@gmail.com',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    // Edit profile, change password, and support buttons
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 140),
                          ),
                        ),
                        // First row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // First button
                            Row(
                              children: [
                                // Icon box with spacing
                                Container(
                                  height: 42,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF373d42),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(child: Icon(Icons.person)),
                                  margin: const EdgeInsets.only(right: 10),
                                ),
                                // SizedBox to create space between icon and text
                                const SizedBox(height: 10),
                                // Rectangle with spacing
                                GestureDetector(
                                  onTap: () {
                                    // Do something when the button is tapped.
                                  },
                                  child: Container(
                                    height: 42,
                                    width: 228,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF373d42),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    margin: const EdgeInsets.only(left: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Spacing between rows
                        const SizedBox(height: 15),
                        // Second row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Second button
                            Row(
                              children: [
                                // Icon box with spacing
                                Container(
                                  height: 42,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF373d42),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(child: Icon(Icons.key)),
                                  margin: const EdgeInsets.only(right: 10),
                                ),
                                // SizedBox to create space between icon and text
                                const SizedBox(height: 10),
                                // Rectangle with spacing
                                GestureDetector(
                                  onTap: () {
                                    // Do something when the button is tapped.
                                  },
                                  child: Container(
                                    height: 42,
                                    width: 228,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF373d42),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Change Password',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    margin: const EdgeInsets.only(left: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Spacing between rows
                        const SizedBox(height: 15),
                        // Third row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Third button
                            Row(
                              children: [
                                // Icon box with spacing
                                Container(
                                  height: 42,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF373d42),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(child: Icon(Icons.help)),
                                  margin: const EdgeInsets.only(right: 10),
                                ),
                                // SizedBox to create space between icon and text
                                const SizedBox(height: 10),
                                // Rectangle with spacing
                                GestureDetector(
                                  onTap: () {
                                    // Do something when the button is tapped.
                                  },
                                  child: Container(
                                    height: 42,
                                    width: 228,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF373d42),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Support',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                                    margin: const EdgeInsets.only(left: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
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
                      return const NavBar(currentScreen: 3,);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
