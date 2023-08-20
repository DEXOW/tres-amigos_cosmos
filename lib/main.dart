import 'dart:math';

import 'package:cosmos/screens/components/animated_star_background.dart';
import 'package:cosmos/screens/profile/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:cosmos/screens/home/home_screen.dart';
import 'package:cosmos/screens/get_started/screen.dart';
import 'package:cosmos/screens/search/search.dart';
import 'package:cosmos/constants.dart';
import 'package:cosmos/screens/splash/screen.dart';
import 'package:cosmos/providers/meta_data_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: MetaDataProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late MetaDataProvider metaDataProvider;
  final Random random = Random();

  void initStars(screenWidth, screenHeight, context) {
    metaDataProvider = Provider.of<MetaDataProvider>(context);
    metaDataProvider.stars = List.generate(30, (index) {
      return Star(
        x: random.nextDouble() * screenWidth,
        y: random.nextDouble() * screenHeight,
        size: random.nextDouble() * 5 + 1,
        opacity: random.nextDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    initStars(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height, context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cosmos',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: kPrimaryColor),
        child: ProfileScreen(),
      ),
    );
  }
}
