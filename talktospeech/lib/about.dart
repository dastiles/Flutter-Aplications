import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('About Us'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Text(
                'Word Beater app was created by Charles Madhuku. Word  Beater is still in Beta stage and  was created for fun. Please shout out at me (0771315239)',
                style: TextStyle(
                  fontSize: 15,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text('App Version: 1.0.0'),
              Spacer(),
              Text(
                'DaStiles Apps',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
