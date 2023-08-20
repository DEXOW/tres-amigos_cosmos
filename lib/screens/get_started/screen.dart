import 'package:flutter/material.dart';
import 'package:cosmos/screens/components/animated_star_background.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool isMoving = false;
  double containerYPosition = 0.0;

  void _startAnimation() {
    setState(() {
      isMoving = true;
    });
  }

  void _animateContainer() {
    setState(() {
      containerYPosition = 500.0; // Set the Y position you want to animate to
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = 332.32;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter -
              AlignmentDirectional(0, -imageHeight / screenHeight),
          children: [
            AnimatedStarBackground(
                screenHeight: screenHeight, screenWidth: screenWidth),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              transform: isMoving
                  ? Matrix4.translationValues(
                      0, -screenHeight + imageHeight * 0.5, 0)
                  : Matrix4.identity(),
              child: Image.asset(
                'assets/images/spacex-shuttle.png',
                width: 197.94,
                height: 332.32,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end, // Vertical alignment
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  transform:
                      Matrix4.translationValues(0, containerYPosition, 0),
                  alignment: AlignmentDirectional.center,
                  width: 316,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(43, 50, 56, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    SizedBox(height: 20),
                    Text(
                      'Start Together',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'We will guide you to where',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                    ),
                    Text(
                      'you wanted it too',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _animateContainer();
                        _startAnimation();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x5C6166),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text('Get Started',
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                    )
                  ]),
                ),
                SizedBox(height: 55),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GetStartedScreen(),
  ));
}
