import 'package:flutter/material.dart';

import 'package:cosmos/screens/register/screen.dart';
import 'package:cosmos/screens/components/animated_star_background.dart';
import 'package:cosmos/screens/home/screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
      
      double screenHeight = MediaQuery.of(context).size.height;
      double screenWidth = MediaQuery.of(context).size.width;
  
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AnimatedStarBackground(screenHeight: screenHeight, screenWidth: screenWidth),
              Positioned(
                child: FittedBox(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F353B).withOpacity(0.75),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 32.5,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Book your interplanetary travel ticket',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Color(0xFFA4A4A4),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            const Text(
                              'Username',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: Color(0xFF9C9C9C),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                filled: true,
                                fillColor: Color(0xFF252D33),
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            const Text(
                              'Password',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: Color(0xFF9C9C9C),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                filled: true,
                                fillColor: Color(0xFF252D33),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        TextButton(
                          onPressed: () {
                            login();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF5C6166)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(color: Color(0xFF2F353B)),
                              ),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // const SizedBox(height: 0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account ? ',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFA4A4A4),
                                ),
                              ),
                              Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF00D5F5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.2,
                              height: 1,
                              color: const Color(0xFFA4A4A4),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'or',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'Poppins',
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: screenWidth * 0.2,
                              height: 1,
                              color: const Color(0xFFA4A4A4),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                color: Color(0xFF21282E),
                              ),
                              child: Image.asset('assets/icons/google_logo.png'),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 60,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                color: Color(0xFF21282E),
                              ),
                              child: Image.asset('assets/icons/apple_logo.png'),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 60,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                color: Color(0xFF21282E),
                              ),
                              child: Image.asset('assets/icons/facebook_logo.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}