import 'dart:async';
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lets_speak/main.dart';
import 'package:lets_speak/models/settings.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late int index;
  var timer;

  String myword = '';
  int time = 10;
  bool stop = false;
  FlutterTts fluttertts = FlutterTts();
  int highScore = 0;
  // late String typedWord;
  @override
  void initState() {
    super.initState();
    ind();
    myFunction();
  }

  @override
  void dispose() {
    super.dispose();
    fluttertts.stop();
    stop = true;
  }

  myFunction() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      time--;
      if (stop) {
        timer.cancel();
      } else {
        if (myword == all[index]) {
          print('how man');
        }
        check();
      }

      setState(() {});
    });
  }

  ind() {
    index = Random().nextInt(4000);
    print(all.length);
    syllables('beautiful');
  }

  check() {
    if (time < 5) {
      fluttertts.speak(time.toString());
    }

    if (time > highScore) {
      highScore = time;
    }
    if (time < 1) {
      fluttertts.speak(' sorry you loose');
      stop = true;
      myword = '';
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Game over'),
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    Text('High Score: ' + highScore.toString() + ' Seconds'),
                    TextButton(
                        onPressed: () {
                          stop = false;
                          myword = '';
                          ind();
                          myFunction();
                          time = 10;
                          Navigator.pop(context);
                        },
                        child: Text('OK')),
                  ],
                ),
              ),
            );
          });
      //Navigator.pop(context);
    }
  }

  myletters(l) {
    if (l != '') {
      if (l != '<=') {
        if (myword.length > 20) return;

        setState(() {
          myword += l;
        });
        String typedWord = all[index];
        if (typedWord == myword) {
          if (typedWord.length <= 4) {
            time += 3;
          } else if (typedWord.length <= 10) {
            time += 5;
          } else {
            time += 7;
          }

          ind();
          myword = '';
          fluttertts.speak(all[index]);
        }
        setState(() {});
      } else {
        List word = myword.split('');

        myword = '';
        for (var i = 0; i < word.length - 1; i++) {
          myword += word[i];
        }
        setState(() {});
      }
    } else {
      print('wow');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Beater'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: size.width,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    all[index],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Text(time.toString(),
                style: TextStyle(
                  fontSize: 17,
                  color: time < 5 ? Colors.red : Colors.green,
                )),
            Expanded(
              child: Container(
                  width: size.width * 0.9,
                  height: 70,
                  child: Center(
                    child: Text(
                      myword == '' ? 'type the word' : myword,
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
            ),
            Spacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                width: size.width,
                height: 200,
                child: Center(
                  child: GridView.count(
                    childAspectRatio: 150 / 220,
                    crossAxisCount: 10,
                    padding: EdgeInsets.all(1.0),
                    children: letters
                        .map((e) => InkWell(
                              onTap: () {
                                myletters(e);
                              },
                              onLongPress: () {
                                myword = '';
                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  e,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            //Spacer(),
          ],
        ),
      ),
    );
  }
}
