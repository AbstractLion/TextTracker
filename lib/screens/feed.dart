import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class FeedScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildCard(context);
      },
    );
  }

  Widget _buildCard(BuildContext context) {
    return GFCard(
      boxFit: BoxFit.contain,
      height: 400,
      image: Image.network(
        'https://images-na.ssl-images-amazon.com/images/I/81G9RTo7a3L.jpg',
        height: 200,
      ),
      title: GFListTile(
        title: Text('Dragon He'),
      ),
      content: Text('Hi noob'),
    );
  }
}
