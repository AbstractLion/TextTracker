import 'package:flutter/material.dart';
import 'package:login_example/screens/discover.dart';
import 'package:login_example/screens/feed.dart';
import 'package:login_example/screens/quizzes.dart';
import 'package:login_example/screens/rankings.dart';

import 'transition_route_observer.dart';
import 'widgets/text_tracker_app_bar.dart';
import 'widgets/text_tracker_bottom_navigation_bar.dart';

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
        appBar: TextTrackerAppBar(
          page: _currentPage,
          setPage: _setPage,
        ),
        bottomNavigationBar: TextTrackerBottomNavigationBar(
          setPage: _setPage,
        ),
        body: _getPage(_currentPage),
      ),
    );
  }

  void _setPage(int position) {
    setState(() {
      _currentPage = position;
    });
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
