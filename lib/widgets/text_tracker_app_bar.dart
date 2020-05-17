import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class TextTrackerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int page;
  final Function(int) setPage;

  TextTrackerAppBar({this.page, this.setPage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    FlutterStatusbarManager.setColor(Colors.white);
    FlutterStatusbarManager.setStyle(StatusBarStyle.DARK_CONTENT);

    return GFAppBar(
      backgroundColor: Colors.white,
      leading: page >= 4
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      title: Text(
        _getTitle(this.page),
        style: TextStyle(
          color: Colors.black,
          fontFamily: theme.textTheme.display1.fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onSelected: (String value) => _handleMenuClick(context, value),
          itemBuilder: (BuildContext context) {
            return ['View Profile', 'Settings', 'Logout'].map((String choice) {
              return PopupMenuItem(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  void _handleMenuClick(BuildContext context, String value) {
    switch (value) {
      case 'View Profile':
        Navigator.of(context).pushNamed('/profile');
        break;
      case 'Settings':
        break;
      case 'Logout':
        break;
    }
  }

  String _getTitle(int page) {
    switch (page) {
      case 0:
        return 'Feed';
      case 1:
        return 'Rankings';
      case 2:
        return 'Quizzes';
      case 3:
        return 'Discover';
      case 4:
        return 'My Profile';
    }
    return 'TextTracker';
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
