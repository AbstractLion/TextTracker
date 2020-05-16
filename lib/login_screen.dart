import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';

import 'constants.dart';
import 'custom_route.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FlutterLogin(
        theme: LoginTheme(
          pageColorDark: Colors.white,
          pageColorLight: Colors.white,
          buttonTheme: LoginButtonTheme(
            backgroundColor: Colors.black,
          ),
          bodyStyle: TextStyle(
            color: Colors.black,
          ),
          inputTheme: InputDecorationTheme(
            prefixStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        title: Constants.appName,
        logo: 'assets/images/logo.png',
        titleTag: Constants.titleTag,
        emailValidator: (value) {
          return null;
        },
        passwordValidator: (value) {
          return null;
        },
        onLogin: (loginData) {
          return null;
        },
        onSignup: (loginData) {
          return null;
        },
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(FadePageRoute(
            builder: (context) => MainScreen(),
          ));
        },
        onRecoverPassword: (name) {
          return null;
        },
      ),
    );
  }
}
