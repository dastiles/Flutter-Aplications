import 'package:flutter/material.dart';

class AchievePage extends StatelessWidget {
  const AchievePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
          )
        ]),
      ),
    );
  }
}
