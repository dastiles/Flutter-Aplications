import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoute_2/models/dataProvider.dart';
import 'package:qoute_2/pages/HomePage.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashDelay = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var qouteFavorates = Provider.of<DataProvider>(context, listen: false);
    qouteFavorates.retreive();
    _loadWidget();
  }

  _loadWidget() {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Qoute You',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Lora',
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            'Charles Madhuku',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Raleway',
              //fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )
        ],
      )),
    );
  }
}
