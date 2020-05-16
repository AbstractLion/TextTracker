import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'transition_route_observer.dart';
import 'dart:math' as math;
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute>();
  static const headerAniInterval =
      const Interval(.1, .3, curve: Curves.easeOut);
  Animation<double> _headerScaleAnimation;
  AnimationController _loadingController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController,
      curve: headerAniInterval,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController.forward();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => _goToLogin(context),
      child: SafeArea(
        child: Scaffold(
          appBar: TextTrackerAppBar(),
          bottomNavigationBar: TextTrackerBottomNavigationBar(),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Container()),
        ),
      ),
    );
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
        backgroundColor: Colors.transparent,
        size: Size(double.infinity, 125),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.0);
}

class TextTrackerBottomNavigationBar extends StatelessWidget {
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
        
      },
    );
  }
}
