import 'package:login_example/models/book.dart';

class Books {
  static const List<Book> books = [
    Book(
      title: "Competitive Programmer's Handbook",
      author: "Antti Laaksonen",
      imageUrl: 'https://cses.fi/book/gtcp.jpg',
    ),
    Book(
      title: "You Don't Know JS Yet",
      author: "Kyle Simpson",
      imageUrl:
          'https://github.com/getify/You-Dont-Know-JS/raw/2nd-ed/get-started/images/cover.png',
    ),
    Book(
      title: "Calculus and Vectors 12",
      author: "Nelson",
      imageUrl:
          'https://www.mynelson.com/mynelson/getProductCover.dw?prodID=7411001',
    ),
    Book(
      title: "Algorithms",
      author: "Jeff Erickson",
      imageUrl:
          'https://jeffe.cs.illinois.edu/teaching/algorithms/FrontCover.png',
    ),
  ];

  static Book getBook(int index) {
    return books[index];
  }
}
