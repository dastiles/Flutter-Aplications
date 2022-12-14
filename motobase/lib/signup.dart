import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:motobase/emailLogin.dart';
import 'package:motobase/signemailup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autheticate users'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Meet up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SignInButton(
            Buttons.Email,
            text: 'Sign up with email',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailSignUp(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SignInButton(
            Buttons.Google,
            text: 'Sign up with Google',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SignInButton(
            Buttons.Twitter,
            text: 'Sign up with Twitter',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            child: Text(
              'Log in using Email',
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.blue),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailLogIn(),
                ),
              );
            },
          ),
        ),
      ])),
    );
  }
}
