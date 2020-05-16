import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_example/screens/discover.dart';
import 'package:login_example/screens/feed.dart';
import 'package:login_example/screens/quizzes.dart';
import 'package:login_example/screens/rankings.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'transition_route_observer.dart';
import 'dart:math' as math;
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

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
        bottomNavigationBar: TextTrackerBottomNavigationBar(
          setPage: (position) {
            setState(() {
              _currentPage = position;
            });
          }
        ),
        body: _getPage(_currentPage),
      ),
    );
  }

  _getPage(int page) {
    switch(page) {
      case 0: return FeedScreen();
      case 1: return RankingsScreen();
      case 2: return QuizzesScreen();
      case 3: return DiscoverScreen();
    }
  }
}

class TextTrackerAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Colors.red, Color(0xEEF44336)],
            [Colors.red[800], Color(0x77E57373)],
            [Colors.orange, Color(0x66FF9800)],
            [Colors.yellow, Color(0x55FFEB3B)]
          ],
          heightPercentages: [0.20, 0.26, 0.28, 0.35],
          durations: [1000000, 1000000, 1000000, 1000000],
          blur: MaskFilter.blur(BlurStyle.solid, 20),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        waveAmplitude: 0,
        backgroundColor: Colors.transparent,
        size: Size(double.infinity, 125),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.0);
}

class TextTrackerBottomNavigationBar extends StatelessWidget {
  final void Function(int) setPage;

  TextTrackerBottomNavigationBar({this.setPage});

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
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