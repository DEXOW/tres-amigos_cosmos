import 'package:flutter/material.dart';
import 'package:cosmos/screens/components/animated_star_background.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isMoving = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        isMoving = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double imageWidth = 129;
    double imageHeight = 98;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedStarBackground(
                screenHeight: screenHeight, screenWidth: screenWidth),
            Positioned(
              top: screenHeight * 0.5 - imageHeight * 0.5,
              left: screenWidth * 0.5 - imageWidth * 0.5,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                transform: isMoving
                    ? Matrix4.translationValues(
                        screenWidth * 1, -screenHeight * 0.5, 0) // Move upwards
                    : Matrix4.identity(), // Reset position
                child: Image.asset(
                  'assets/images/intersect.png',
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
