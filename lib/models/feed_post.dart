import 'book.dart';
import 'reply.dart';
import 'user.dart';

class FeedPost {
  final User user;
  final Book book;
  final String text;
  final int numViews;
  final List<Reply> replies;

  FeedPost({
    this.user,
    this.book,
    this.text,
    this.numViews,
    this.replies,
  });
}
