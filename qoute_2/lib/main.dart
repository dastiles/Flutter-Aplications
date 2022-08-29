import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoute_2/models/dataProvider.dart';
import 'package:qoute_2/pages/splash.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: Consumer<DataProvider>(
        builder: (context, dataProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Qoutes',
          home: Splash(), //HomePage(),
        ),
      ),
    );
  }
}
