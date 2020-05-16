import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class RankingsScreen extends StatelessWidget {
  final List<Color> topRankColors = [
    Color.fromRGBO(254, 207, 64, 1),
    Color.fromRGBO(206, 207, 189, 1),
    Color.fromRGBO(237, 155, 88, 1)
  ];
  final List<String> placeSuffix = ["st", "nd", "rd"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildListItem,
      padding: const EdgeInsets.all(10),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final Color itemColor = index < topRankColors.length
        ? topRankColors[index]
        : Color.fromRGBO(247, 247, 247, 1);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            color: itemColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Badge(
              child: GFAvatar(
                shape: GFAvatarShape.standard,
                size: GFSize.SMALL,
                backgroundImage: NetworkImage(
                    "https://media-exp1.licdn.com/dms/image/C4D03AQEUgiIGoubZSg/profile-displayphoto-shrink_200_200/0?e=1594857600&v=beta&t=P5pAjXfb1gKTxDqe6zJwyBffU-NHXd9SJzG7KIHAIV0"),
              ),
              badgeContent: Text(
                (index + 1).toString(),
                style: TextStyle(color: itemColor, fontWeight: FontWeight.bold),
              ),
              position: BadgePosition.topLeft(left: -5, top: -10),
              badgeColor:
                  index < 3 ? Colors.white : Color.fromRGBO(242, 109, 17, 1),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Leon Si", style: TextStyle(fontSize: 15)),
                Text("@leonzalion", style: TextStyle(fontSize: 11))
              ],
            ),
            Spacer(flex: 15),
            Text("250k",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
