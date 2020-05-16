import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class DiscoverScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
      pinned: true,
      padding: EdgeInsets.only(top: 10.0),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return _buildCard(context);
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

  Widget _buildCard(BuildContext context) {
    final theme = Theme.of(context);

    return GFCard(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      content: Column(
        children: [
          Container(
            child: GFListTile(
              padding: EdgeInsets.all(0),
              titleText: 'Dragon He',
              subtitleText: '@abstractultra',
              avatar: GFAvatar(
                backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4D03AQEyzcJ9UyrGtA/profile-displayphoto-shrink_200_200/0?e=1594857600&v=beta&t=kZZPJ914NnMXhueWSv8mql-p-NBrFmhcJkVvOGhWkW0',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
