import 'package:flutter/material.dart';
import 'dart:math';

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
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: List<Widget>.generate(18, (value) => 
                    Positioned(
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
                    )
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}