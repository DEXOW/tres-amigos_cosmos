import 'package:flutter/material.dart';

import 'package:cosmos/screens/components/animated_star_background.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool isMoving = false;
  bool isImageVisible = true;

  void _startAnimation() {
    setState(() {
      isMoving = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isMoving = false;
        isImageVisible = false;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            isImageVisible = true;
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                isMoving = true;
              });
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  isMoving = false;
                  isImageVisible = false;
                });
              });
            });
          });
        });
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
            Stack(
              alignment: AlignmentDirectional.center,
              children: List<Widget>.generate(
                18,
                (value) => Positioned(
                  top: random.nextDouble() * screenHeight,
                  left: random.nextDouble() * screenWidth,
                  child: Container(
                    width: 2,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            if (isImageVisible)
              Positioned(
                top: screenHeight * 0.5 - imageHeight * 0.5,
                left: screenWidth * 0.5 - imageWidth * 0.5,
                child: GestureDetector(
                  onTap: () {
                    _startAnimation();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    transform: isMoving
                        ? Matrix4.translationValues(
                            0, -screenHeight * 0.4, 0) // Move upwards
                        : Matrix4.identity(), // Reset position
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      transform: isMoving
                          ? Matrix4.translationValues(
                              screenWidth * 0.3, 0, 0) // Move right
                          : Matrix4.identity(), // Reset position
                      child: Image.asset(
                        'assets/images/intersect.png',
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      ),
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
