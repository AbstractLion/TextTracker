import 'books.dart';
import 'feed_post.dart';
import 'users.dart';

class Feed {
  static List<FeedPost> posts = [
    FeedPost(
      book: Books.getBook(0),
      user: Users.getUser(0),
      text:
          "Just finished chapter 4 of \"Competitive Programmer's Handbook\" by Antti Laaksonen! Learned a lot of new data structures that I'm definitely going to use soon :)",
      numViews: 36,
    ),
    FeedPost(
      book: Books.getBook(1),
      user: Users.getUser(1),
      text:
          "Just finished reading You Don't Know JS Yet (2nd Edition) - Scope & Closures by Kyle Simpson! He taught me a lot about JavaScript that I haven't heard about in the past few years of coding it! I really appreciate his work and the fact that it's free and open source!",
      numViews: 42,
    ),
    FeedPost(
      book: Books.getBook(2),
      user: Users.getUser(2),
      text:
          "I just finished chapter 6 of Calculus and Vectors 12, thanks to MyNelson! If you didn't know, they provided free access to a ton of eBooks online that follow the curriculm! You can learn more at https://www.nelson.com/learningonline/k12openaccess!",
      numViews: 21,
    ),
    FeedPost(
      book: Books.getBook(3),
      user: Users.getUser(3),
      text:
          "Just finished reading the first chapter of Algorithms by Jeff Erickson! This has to be perhaps the most interesting take to teaching I've seen, for he inserts many humourous jokes and side notes in this book that make it a lot more enjoyable!",
      numViews: 51,
    ),
  ];

  static FeedPost getPost(int index) {
    return posts[index];
  }
}
