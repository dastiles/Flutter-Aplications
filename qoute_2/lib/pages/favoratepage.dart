import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoute_2/models/dataProvider.dart';
import 'package:qoute_2/models/qoute_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_share/social_share.dart';

// ignore: must_be_immutable
class FavoratePage extends StatefulWidget {
  String imageurl;
  int tag;
  FavoratePage(this.imageurl, this.tag);
  @override
  _FavoratePageState createState() => _FavoratePageState();
}

class _FavoratePageState extends State<FavoratePage> {
  Future<SharedPreferences> save = SharedPreferences.getInstance();
  String selected;
  List<String> favorate = [];
  // bool liked;
  @override
  void initState() {
    super.initState();
  }

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
              // List favarated =  dataProvider.retreive()
              itemCount: dataProvider.favorate.length,
              itemBuilder: (context, i) {
                bool liked = true;

                //readLike(qoute);
                return Column(
                  children: <Widget>[
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          //height: MediaQuery.of(context).size.height / 6,
                          child: Column(
                            children: <Widget>[
                              ClayText(
                                dataProvider.favorate[i],
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
                              setState(
                                  () => {selected = dataProvider.favorate[i]});
                              SocialShare.copyToClipboard(
                                  dataProvider.favorate[i]);
                            },
                            splashColor: Colors.grey,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: dataProvider.favorate[i] != selected
                                  ? Text('Copy')
                                  : Text('Copied'),
                            ),
                          ),
                          VerticalDivider(),
                          InkWell(
                            onTap: () {
                              setState(
                                  () => {selected = dataProvider.favorate[i]});
                              SocialShare.copyToClipboard(
                                  dataProvider.favorate[i]);
                            },
                            splashColor: Colors.grey,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                              child: IconButton(
                                onPressed: () {
                                  SocialShare.shareWhatsapp(
                                      dataProvider.favorate[i]);
                                },
                                icon: Icon(
                                  Icons.chat,
                                ),
                                color: Colors.green,
                              ),
                            ),
                          ),
                          VerticalDivider(),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 3, 10, 5),
                            child: IconButton(
                              onPressed: () {
                                dataProvider
                                    .saveQoute(dataProvider.favorate[i]);
                              },
                              icon: Icon(
                                Icons.favorite,
                              ),
                              color: Colors.red,
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
