import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';

import '../models/feed.dart';
import '../models/feed_post.dart';

class FeedScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: Feed.posts.length,
        itemBuilder: (context, index) {
          return _buildCard(context, Feed.getPost(index));
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, FeedPost post) {
    final theme = Theme.of(context);

    return GFCard(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      content: Column(
        children: [
          Container(
            child: GFListTile(
              padding: EdgeInsets.all(0),
              titleText: post.user.name,
              subtitleText: '@' + post.user.handle,
              avatar: GFAvatar(
                backgroundImage: NetworkImage(post.user.avatarUrl),
              ),
            ),
          ),
          Row(
            children: [
              Image.network(
                post.book.imageUrl,
                height: 150,
                width: 100,
                fit: BoxFit.cover,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(post.text),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 10),
            child: Row(
              children: [
                _buildButton(
                  context,
                  onPressed: () {},
                  icon: Icon(Icons.bookmark, color: Colors.black),
                ),
                _buildButton(
                  context,
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.reply,
                    color: Colors.black,
                  ),
                ),
                _buildButton(
                  context,
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.retweet,
                    color: Colors.black,
                  ),
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

  Widget _buildButton(BuildContext context,
      {void Function() onPressed, Icon icon}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: GFIconButton(
        icon: icon,
        onPressed: onPressed,
        type: GFButtonType.outline,
        shape: GFIconButtonShape.circle,
        color: Colors.black,
      ),
    );
  }
}
