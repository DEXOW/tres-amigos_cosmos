import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cosmos/providers/meta_data_provider.dart';

class Star {
  double x;
  double y;
  double size;
  double opacity;

  Star({
    required this.x, 
    required this.y, 
    required this.size, 
    required this.opacity
  });
}

class AnimatedStarBackground extends StatefulWidget {
  final screenHeight;
  final screenWidth;
  const AnimatedStarBackground({Key? key, required this.screenHeight, required this.screenWidth}) : super(key: key);

  @override
  State<AnimatedStarBackground> createState() => _AnimatedStarBackgroundState();
}

class _AnimatedStarBackgroundState extends State<AnimatedStarBackground> {

  late MetaDataProvider metaDataProvider;
  final Random random = Random();
  late List<Star> stars;

  @override
  void initState() {
    super.initState();
    metaDataProvider = Provider.of<MetaDataProvider>(context, listen: false);
    stars = metaDataProvider.stars;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        stars[random.nextInt(30)].size = random.nextDouble() * 3 + 1;
      });
    });

    return Stack(
      children: 
        stars.map((star) => Positioned(
          left: star.x,
          top: star.y,
          child: Opacity(
            opacity: star.opacity,
            child: StarWidget(star.size),
          ),
        )).toList(),
    );
  }

  Widget StarWidget(double size){
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