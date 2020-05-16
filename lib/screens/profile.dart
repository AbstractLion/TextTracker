import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:getflutter/getflutter.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildCard(context);
      },
    );
  }

  Widget _buildCard(BuildContext context) {
    final theme = Theme.of(context);

    return GFCard(
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
          Row(
            children: [
              Image.network(
                'https://cses.fi/book/gtcp.jpg',
                height: 150,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "Just finished chapter 4 of \"Competitive Programmer's Handbook\" by Antti Laaksonen! Learned a lot of new data structures that I'm definitely going to use soon :)",
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Row(
              children: [
                GFIconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                  type: GFButtonType.outline,
                  shape: GFIconButtonShape.circle,
                  color: Colors.black,
                ),
                Spacer(),
                Text(
                  '36 views',
                  style: TextStyle(
                    fontFamily: theme.textTheme.display1.fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
