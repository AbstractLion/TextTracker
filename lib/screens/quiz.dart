import 'package:badges/badges.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getflutter/getflutter.dart';

class QuizScreen extends StatelessWidget {
  final int bookId;
  final int chapter;

  QuizScreen({@required this.bookId, @required this.chapter});

  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
      pinned: true,
      padding: EdgeInsets.only(top: 10.0),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return _buildCard(context);
      },
      trailing: Badge(
        badgeContent: Icon(Icons.add),
        child: Icon(FontAwesomeIcons.book),
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

    return GFAccordion(
      titleChild: Row(
        children: [
          Image.network(
            'https://cses.fi/book/gtcp.jpg',
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
                    "Competitive Programmer's Handbook",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Antti Laaksonen",
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
