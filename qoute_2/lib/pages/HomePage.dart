import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:qoute_2/models/qoute_class.dart';
import 'package:qoute_2/pages/aboutpage.dart';
import 'package:qoute_2/pages/favoratepage.dart';
import 'package:qoute_2/pages/qoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  List<String> favorate = [];
  Future<SharedPreferences> save = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/mount.jpeg'))),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TapPage(
                        imageurl: 'assets/bg_1.jpg',
                        qouteText: 'General Qoutes',
                        qoutes: general,
                        tag: 1,
                      ),
                      TapPage(
                          imageurl: 'assets/good.jpg',
                          qouteText: 'Funny Qoutes',
                          qoutes: funnyQoutes,
                          tag: 2),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      TapPage(
                          imageurl: 'assets/fire_1.jpg',
                          qouteText: 'Love Qoutes',
                          qoutes: loveQoute,
                          tag: 5),
                      TapPage(
                          imageurl: 'assets/fire.jpg',
                          qouteText: 'PickUp Lines',
                          qoutes: pickLines,
                          tag: 4),
                    ],
                  ),
                  Row(children: [
                    TapPage(
                        imageurl: 'assets/love_1.jpg',
                        qouteText: 'Love Messages',
                        qoutes: love,
                        tag: 3),
                    TapPage(
                        imageurl: 'assets/love_2.jpg',
                        qouteText: 'Forgive Me Messages',
                        qoutes: forgive,
                        tag: 6),
                  ]),
                  Row(children: [
                    TapPage(
                      imageurl: 'assets/break.jpg',
                      qoutes: heartBreak,
                      qouteText: 'Heart Break Messages',
                      tag: 7,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoratePage(
                              'assets/mount.jpeg',
                              8,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 8,
                        child: QouteContainer(
                          imageurl: 'assets/mount.jpeg',
                          qouteText: 'Favourate Qoutes',
                          number: '#',
                        ),
                      ),
                    )
                  ])
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                //color: Colors.white,
                //borderRadius: 20,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                  color: Colors.blueAccent,
                  icon: Icon(Icons.person),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage())),
                  tooltip: 'about the developer',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TapPage extends StatelessWidget {
  String imageurl;
  List qoutes;
  String qouteText;
  int tag;

  TapPage({
    this.imageurl,
    this.qouteText,
    this.qoutes,
    this.tag,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              qoutes, //heartBreak,
              imageurl, //'assets/break.jpg',
              tag,
            ),
          ),
        );
      },
      child: Hero(
        tag: tag,
        child: QouteContainer(
          imageurl: imageurl,
          qouteText: qouteText,
          number: qoutes.length.toString(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class QouteContainer extends StatelessWidget {
  String imageurl;
  String qouteText;
  String number;
  QouteContainer({
    Key key,
    @required this.imageurl,
    @required this.qouteText,
    @required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClayContainer(
        borderRadius: 20,
        spread: 2,
        depth: 2,
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height / 4.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageurl),
                ),
              ),
            ),
            Opacity(
              opacity: 0.6,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 30,
                width: 40,
                child: Center(
                    child: Text(
                  number,
                  style: TextStyle(fontFamily: 'Lora', color: Colors.redAccent),
                )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    qouteText,
                    style: TextStyle(
                        fontFamily: 'Lora',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
