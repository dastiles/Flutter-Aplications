import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:motobase/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meet Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final fb = FirebaseDatabase.instance;
//   final myController = TextEditingController();
//   final name = 'Charles';
//   var retrievedName;

//   @override
//   Widget build(BuildContext context) {
//     final ref = fb.reference();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(name),
//                 SizedBox(width: 20),
//                 Expanded(child: TextField(controller: myController)),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.child(name).set(myController.text);
//               },
//               child: Text('submit'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.child('Charles').once().then((DataSnapshot data) {
//                   print(data.value);
//                   print(data.key);
//                   setState(() {
//                     retrievedName = data.value;
//                   });
//                 });
//               },
//               child: Text('Get'),
//             ),
//             Text(retrievedName ?? "")
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     myController.dispose();
//     super.dispose();
//   }
// }
