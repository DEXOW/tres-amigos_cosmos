import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedStarBackground extends StatefulWidget {
  final screenHeight;
  final screenWidth;
  const AnimatedStarBackground({Key? key, required this.screenHeight, required this.screenWidth}) : super(key: key);

  @override
  State<AnimatedStarBackground> createState() => _AnimatedStarBackgroundState();
}

class _AnimatedStarBackgroundState extends State<AnimatedStarBackground> with SingleTickerProviderStateMixin {

  final Random random = Random();
  late List<dynamic> stars;

  @override
  void initState() {
    super.initState();

    setState(() {
      stars = List.generate(30, (index) => {
        'x': random.nextDouble() * widget.screenWidth,
        'y': random.nextDouble() * widget.screenHeight,
        'size': random.nextDouble() * 5 + 1,
        'opacity': random.nextDouble(),
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        stars[random.nextInt(30)]['size'] = random.nextDouble() * 3 + 1;
      });
    });

    return Stack(
      children: 
        stars.map((star) => Positioned(
          left: star['x'],
          top: star['y'],
          child: Opacity(
            opacity: star['opacity'],
            child: Star(star['size']),
          ),
        )).toList(),
    );
  }

  Widget Star(double size){
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}