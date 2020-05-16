import 'feed_post.dart';

class Feed {
  static const List<FeedPost> posts = [
    FeedPost(
      bookImageUrl: 'https://cses.fi/book/gtcp.jpg',
      userAvatarUrl:
          'https://www.gravatar.com/avatar/71b976c366a90ffcefcd8f2d6535cfd2?d=https%3A%2F%2Fdevpost-challengepost.netdna-ssl.com%2Fassets%2Fdefaults%2Fno-avatar-180.png&s=180',
      text:
          "Just finished chapter 4 of \"Competitive Programmer's Handbook\" by Antti Laaksonen! Learned a lot of new data structures that I'm definitely going to use soon :)",
      numViews: 36,
      userHandle: 'avanrocks',
      userName: 'Avaneesh Kulkarni',
    ),
    FeedPost(
      bookImageUrl:
          'https://github.com/getify/You-Dont-Know-JS/raw/2nd-ed/get-started/images/cover.png',
      userAvatarUrl:
          'https://media-exp1.licdn.com/dms/image/C4D03AQEUgiIGoubZSg/profile-displayphoto-shrink_100_100/0?e=1594857600&v=beta&t=IYQoQIDKsVhmuwRPVK6SkvSreatI2TOeCcUSTQ9y97w',
      text:
          "Just finished reading You Don't Know JS Yet (2nd Edition) - Scope & Closures by Kyle Simpson! He taught me a lot about JavaScript that I haven't heard about in the past few years of coding it! I really appreciate his work and the fact that it's free and open source!",
      numViews: 42,
      userHandle: 'leonzalion',
      userName: 'Leon Si',
    ),
    FeedPost(
      bookImageUrl:
          'https://www.mynelson.com/mynelson/getProductCover.dw?prodID=7411001',
      userAvatarUrl:
          'https://lh6.googleusercontent.com/-_nBF0nCta-k/AAAAAAAAAAI/AAAAAAAAIsM/sGWdxvdrtqgKYUnjuvu6HDsRMppamS8BgCLcDEAE/s32-c-k-no/photo.jpg',
      text:
          "I just finished chapter 6 of Calculus and Vectors 12, thanks to MyNelson! If you didn't know, they provided free access to a ton of eBooks online that follow the curriculm! You can learn more at https://www.nelson.com/learningonline/k12openaccess!",
      numViews: 21,
      userHandle: 'sir.melitonk',
      userName: 'Kevin Wang',
    ),
    FeedPost(
      bookImageUrl:
          'https://jeffe.cs.illinois.edu/teaching/algorithms/FrontCover.png',
      userAvatarUrl:
          'https://media-exp1.licdn.com/dms/image/C4D03AQEyzcJ9UyrGtA/profile-displayphoto-shrink_200_200/0?e=1594857600&v=beta&t=kZZPJ914NnMXhueWSv8mql-p-NBrFmhcJkVvOGhWkW0',
      text:
          "Just finished reading the first chapter of Algorithms by Jeff Erickson! This has to be perhaps the most interesting take to teaching I've seen, for he inserts many humourous jokes and side notes in this book that make it a lot more enjoyable!",
      numViews: 51,
      userHandle: 'abstractultra',
      userName: 'Dragon He',
    ),
  ];

  static FeedPost getPost(int index) {
    return posts[index];
  }
}
