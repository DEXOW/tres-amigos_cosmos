import 'package:flutter/material.dart';
import 'dart:math';

import 'package:cosmos/screens/components/animated_star_background.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}
class _GetStartedScreenState extends State<GetStartedScreen> {

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
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned(
                child: AnimatedStarBackground(screenHeight: screenHeight, screenWidth: screenWidth,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}