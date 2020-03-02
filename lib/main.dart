import 'package:flutter/material.dart';
import './app_screens//home_screen.dart';
//import 'package:flutter_app/app_screens/first_screen.dart';

// void main() => runApp(MyClass());

// class MyClass extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//         title: "My Flutter",
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text("My First Screen"),
//             ),
//             body: FirstScreen()));
//   }
// }

void main () => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    title : "Exploring UI widgets",
    home : Home()
  )
);