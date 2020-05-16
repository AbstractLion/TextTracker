import 'user.dart';

class Users {
  static List<User> users = [
    User(
      avatarUrl:
          'https://www.gravatar.com/avatar/71b976c366a90ffcefcd8f2d6535cfd2?d=https%3A%2F%2Fdevpost-challengepost.netdna-ssl.com%2Fassets%2Fdefaults%2Fno-avatar-180.png&s=180',
      handle: 'avanrocks',
      name: 'Avaneesh Kulkarni',
      reputation: 32344,
    ),
    User(
      avatarUrl:
          'https://lh6.googleusercontent.com/-_nBF0nCta-k/AAAAAAAAAAI/AAAAAAAAIsM/sGWdxvdrtqgKYUnjuvu6HDsRMppamS8BgCLcDEAE/s32-c-k-no/photo.jpg',
      handle: 'sir.melitonk',
      name: 'Kevin Wang',
      reputation: 3442,
    ),
    User(
      avatarUrl:
          'https://media-exp1.licdn.com/dms/image/C4D03AQEyzcJ9UyrGtA/profile-displayphoto-shrink_200_200/0?e=1594857600&v=beta&t=kZZPJ914NnMXhueWSv8mql-p-NBrFmhcJkVvOGhWkW0',
      handle: 'abstractultra',
      name: 'Dragon He',
      reputation: 3421,
    ),
    User(
      avatarUrl:
      'https://media-exp1.licdn.com/dms/image/C4D03AQEUgiIGoubZSg/profile-displayphoto-shrink_100_100/0?e=1594857600&v=beta&t=IYQoQIDKsVhmuwRPVK6SkvSreatI2TOeCcUSTQ9y97w',
      handle: 'leonzalion',
      name: 'Leon Si',
      reputation: 2145,
    ),
  ];

  static User getUser(int index) {
    return users[index];
  }
}
