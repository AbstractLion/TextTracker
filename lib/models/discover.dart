import 'discover_post.dart';

class Discover {
  static const List<DiscoverPost> posts = [
    DiscoverPost(
      name: "eBook Foundation",
      description: "Freely available programming books.",
      hearts: 24,
      websiteImageUrl:
          "https://github.githubassets.com/images/icons/emoji/unicode/1f4da.png",
      websiteUrl: "https://ebookfoundation.github.io/free-programming-books/",
    ),
    DiscoverPost(
      name: "MyNelson",
      description:
          "A robust, one-stop online teaching and learning resourced designed to support student access.",
      hearts: 120,
      websiteImageUrl:
          "https://mma.prnewswire.com/media/1136380/NELSON_Nelson_Provides_Open_Access_to_Educational_Resources_For.jpg?p=twitter",
      websiteUrl: "https://www.nelson.com/learningonline/k12openaccess",
    ),
    DiscoverPost(
      name: 'Free Science Books',
      description:
          "Inspired by free-programming-books, here's free-science-books.",
      hearts: 42,
      websiteImageUrl:
          "https://thumbs-prod.si-cdn.com/s-jZTk0XtVmp-89MlOgFXqaAVe4=/fit-in/1600x0/https://public-media.si-cdn.com/filer/29/0f/290fb8c0-1872-46e5-8c12-235742905def/science_smithsonian_magazine_booklist_2019.png",
      websiteUrl: "https://github.com/EbookFoundation/free-science-books",
    ),
  ];

  static DiscoverPost getPost(int index) {
    return posts[index];
  }
}
