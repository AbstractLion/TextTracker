import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

import '../models/user.dart';
import '../models/users.dart';

class DiscoverScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
      pinned: true,
      padding: EdgeInsets.only(top: 10.0),
      itemCount: Users.users.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildCard(context, index);
      },
      trailing: CircleAvatar(
        child: Text('RD'),
      ),
      onChanged: (String value) {},
      onTap: () {},
      decoration: InputDecoration.collapsed(
        hintText: 'Search...',
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    final theme = Theme.of(context);
    final User user = Users.getUser(index);

    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Container(
        height: 75 + (30 * user.tags.length.toDouble()),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GFAvatar(
                  shape: GFAvatarShape.standard,
                  size: GFSize.SMALL,
                  backgroundImage: NetworkImage(user.avatarUrl),
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
            _buildTag(index),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(int index) {
    final User user = Users.getUser(index);
    var items = List<Widget>();
    for (int i = 0; i < user.tags.length; i++) {
      items.add(Chip(
          label: Text(user.tags[i])
      ));
    }
    return
      SizedOverflowBox(
        size: Size.fromHeight((30 * user.tags.length).toDouble()),
        alignment: Alignment.topLeft,
        child: Transform(
          transform: Matrix4.identity()..scale(0.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          )));
  }
}
