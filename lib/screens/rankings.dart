import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

import '../models/user.dart';
import '../models/users.dart';

class RankingsScreen extends StatelessWidget {
  final List<Color> topRankColors = [
    Color.fromRGBO(254, 207, 64, 1),
    Color.fromRGBO(206, 207, 189, 1),
    Color.fromRGBO(237, 155, 88, 1)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Users.users.length + 1,
      itemBuilder: _buildListItem,
      padding: const EdgeInsets.all(10),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final Color itemColor = index > 0 && index <= topRankColors.length
        ? topRankColors[index - 1]
        : Color.fromRGBO(240, 240, 240, 1);

    if (index == 0) {
      return Container(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: topRankColors[0],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: AssetImage('assets/images/trophy.png'),
              alignment: Alignment(1, 0),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 4),
                  Text("Win a \$50 Textbook!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Spacer(),
                  Text("Score high in this week's contest!"),
                  Text(
                    "Contest ends in 10 hours",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.amber[800],
                    ),
                  ),
                  Spacer(flex: 4),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      final User user = Users.getUser(index - 1);

      return Container(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            color: itemColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Badge(
                child: GFAvatar(
                  shape: GFAvatarShape.standard,
                  size: GFSize.SMALL,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                badgeContent: Text(
                  (index).toString(),
                  style:
                      TextStyle(color: itemColor, fontWeight: FontWeight.bold),
                ),
                position: BadgePosition.topLeft(left: -5, top: -10),
                badgeColor:
                    index <= 3 ? Colors.white : Color.fromRGBO(242, 109, 17, 1),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: TextStyle(fontSize: 15)),
                  Text('@' + user.handle, style: TextStyle(fontSize: 11))
                ],
              ),
              Spacer(flex: 15),
              Text(
                user.reputation.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
