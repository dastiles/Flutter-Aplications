import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motobase/home.dart';
import 'package:motobase/signup.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    return SplashScreen(
      navigateAfterSeconds: result != null ? Home(uid: result.uid) : SignUp(),
      seconds: 5,
      title: Text(
        'Welcome to Meet Up',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: () => print('Flutter'),
      loaderColor: Colors.red,
    );
  }
}
