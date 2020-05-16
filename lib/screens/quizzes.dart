import 'package:badges/badges.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';
import 'package:login_example/models/book.dart';
import 'package:login_example/models/books.dart';

class QuizzesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
      pinned: true,
      padding: EdgeInsets.only(top: 10.0),
      itemCount: Books.books.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: _buildCard(context, index),
        );
      },
      trailing: Badge(
        badgeContent: Icon(
          Icons.add,
          color: Colors.white,
          size: 12,
        ),
        padding: EdgeInsets.all(0),
        badgeColor: Colors.black,
        elevation: 0,
        toAnimate: false,
        position: BadgePosition.topRight(top: 7, right: 2),
        child: IconButton(
          icon: Icon(FontAwesomeIcons.clipboard),
          padding: EdgeInsets.only(bottom: 5, left: 10),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {},
        ),
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
    final Book book = Books.getBook(index);
    return GFAccordion(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      titleChild: Row(
        children: [
          Image.network(
            book.imageUrl,
            height: 100,
            width: 70,
            fit: BoxFit.cover,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    book.author,
                    textAlign: TextAlign.left,
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
