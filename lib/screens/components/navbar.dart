import 'package:cosmos/screens/home/screen.dart';
import 'package:flutter/material.dart';

import 'package:cosmos/screens/search/screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  final currentScreen;
  const NavBar({Key? key, required this.currentScreen}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [false, false, false, false];
    isSelected[widget.currentScreen] = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildIcon(iconPathSVG: "assets/icons/home.svg", onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }, isSelected: isSelected[0]),
        buildIcon(iconPathSVG: "assets/icons/seach.svg", onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        }, isSelected: isSelected[1]),
        buildIcon(iconPathSVG: "assets/icons/booking.svg", onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        }, isSelected: isSelected[2]),
        buildIcon(iconPathSVG: "assets/icons/profile.svg", onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        }, isSelected: isSelected[3]),
      ],
    );
  }

  Widget buildIcon({
    iconPathSVG, 
    onPressed, 
    isSelected,
  }) {
    if (isSelected == true) {
      return buildSelectedIcon(iconPathSVG);
    } else {
      return buildUnselectedIcon(iconPathSVG, onPressed);
    }
  }

  Widget buildUnselectedIcon(String iconPathSVG, onPressed) {
    return IconButton(
      icon: SvgPicture.asset(
        iconPathSVG,
        colorFilter:
            const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }

  Widget buildSelectedIcon(String iconPathSVG) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: SvgPicture.asset(
          iconPathSVG,
          colorFilter: const ColorFilter.mode(
              Colors.black, BlendMode.srcIn),
        ),
      ),
      onPressed: () {},
    );
  }
}