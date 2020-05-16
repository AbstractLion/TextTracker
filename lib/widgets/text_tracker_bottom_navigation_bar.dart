import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextTrackerBottomNavigationBar extends StatelessWidget {
  final void Function(int) setPage;

  TextTrackerBottomNavigationBar({this.setPage});

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      barBackgroundColor: Colors.white,
      activeIconColor: Colors.black,
      inactiveIconColor: Colors.black,
      circleColor: Colors.white,
      tabs: [
        TabData(iconData: FontAwesomeIcons.comments, title: "Feed"),
        TabData(iconData: FontAwesomeIcons.medal, title: "Rankings"),
        TabData(iconData: FontAwesomeIcons.clipboard, title: "Quizzes"),
        TabData(iconData: FontAwesomeIcons.compass, title: "Discover"),
      ],
      onTabChangedListener: (position) {
        setPage(position);
      },
    );
  }
}
