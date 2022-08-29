import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoute_2/models/dataProvider.dart';
import 'package:qoute_2/models/qoute_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_share/social_share.dart';

// ignore: must_be_immutable
class SecondPage extends StatefulWidget {
  List<Qoute> qoutes;
  String imageurl;
  int tag;
  SecondPage(this.qoutes, this.imageurl, this.tag);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<SharedPreferences> save = SharedPreferences.getInstance();
  String selected;
  List<String> favorate;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.tag,
      child: Scaffold(
          body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(widget.imageurl),
          )),
        ),
        Opacity(
          opacity: 0.4,
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Consumer<DataProvider>(
          builder: (context, dataProvider, child) => ListView.builder(
              itemCount: widget.qoutes.length,
              itemBuilder: (context, i) {
                String qoute = widget.qoutes[i].qoute;
                String name = widget.qoutes[i].name;
                return Column(
                  children: <Widget>[
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              ClayText(
                                qoute,
                                textColor: Colors.white,
                                parentColor: Colors.grey,
                                spread: 2,
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.4,
                                    fontSize: 20,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClayText(
                                name,
                                textColor: Colors.redAccent,
                                parentColor: Colors.white,
                                style: TextStyle(
                                  fontFamily: 'Lora',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                    ]),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              dataProvider.textSelected(qoute);
                              SocialShare.copyToClipboard(qoute);
                            },
                            splashColor: Colors.grey,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: qoute != dataProvider.selected
                                  ? Text('Copy')
                                  : Text('Copied'),
                            ),
                          ),
                          VerticalDivider(),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                            child: IconButton(
                              onPressed: () {
                                SocialShare.shareOptions(qoute);
                              },
                              icon: Icon(
                                Icons.chat,
                              ),
                              color: Colors.green,
                            ),
                          ),
                          VerticalDivider(),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.grey,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 3, 10, 5),
                              child: IconButton(
                                onPressed: () {
                                  dataProvider.saveQoute(qoute);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                ),
                                color: dataProvider.liked(qoute) == 1
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ],
                );
              }),
        ),
      ])),
    );
  }
}
