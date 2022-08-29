import 'package:flutter/material.dart';
import 'package:lets_speak/about.dart';
import 'package:lets_speak/achievepage.dart';
import 'package:lets_speak/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Word Beater',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cursive',
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHome(),
                      ),
                    );
                  },
                  child: MyCard(text: 'Play'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AchievePage(),
                      ),
                    );
                  },
                  child: MyCard(text: 'Achievements'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUs(),
                      ),
                    );
                  },
                  child: MyCard(
                    text: 'About Us',
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({
    Key? key,
    required this.text,
  }) : super(key: key);
  late String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
          child: Container(
        width: 150,
        height: 40,
        //color: Colors.black,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      )),
    );
  }
}
