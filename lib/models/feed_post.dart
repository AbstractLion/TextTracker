class FeedPost {
  final String userAvatarUrl;
  final String userName;
  final String userHandle;
  final String bookImageUrl;
  final String text;
  final int numViews;

  const FeedPost({
    this.userAvatarUrl,
    this.userName,
    this.userHandle,
    this.bookImageUrl,
    this.text,
    this.numViews,
  });
}
