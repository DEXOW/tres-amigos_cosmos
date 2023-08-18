import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      left: 50,
                      top: 50,
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
                    // Positioned(
                    //   left: 50,
                    //   top: 50,
                    //   child: Container(
                    //     width: 2,
                    //     height: 2,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}