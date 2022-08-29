import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Qoute You App',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'Developed by charles Madhuku for more info about application say hie to me on following contact details\n \n EMAIL\n \n dastilesforever@gmail.com\n\nWhatsApp\n\n0771315239',
                    style: TextStyle(fontFamily: 'Raleway', fontSize: 18),
                  ),
                ),
                Spacer(),
                ClayText(
                  'DarkWalker',
                  parentColor: Colors.grey,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
