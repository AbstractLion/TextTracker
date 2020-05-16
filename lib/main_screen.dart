import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_example/screens/discover.dart';
import 'package:login_example/screens/feed.dart';
import 'package:login_example/screens/quizzes.dart';
import 'package:login_example/screens/rankings.dart';

import 'transition_route_observer.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/Main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  int _currentPage = 0;

  final routeObserver = TransitionRouteObserver<PageRoute>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: TextTrackerAppBar(),
        bottomNavigationBar:
            TextTrackerBottomNavigationBar(setPage: (position) {
          setState(() {
            _currentPage = position;
          });
        }),
        body: _getPage(_currentPage),
        extendBodyBehindAppBar: true,
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return FeedScreen();
      case 1:
        return RankingsScreen();
      case 2:
        return QuizzesScreen();
      case 3:
        return DiscoverScreen();
    }
  }
}

class TextTrackerAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'TextTracker',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      // #F4F1EA
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

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
