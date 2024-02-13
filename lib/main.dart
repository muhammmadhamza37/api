import 'package:api/Models/example_four.dart';
import 'package:api/Models/example_three.dart';
import 'package:api/Models/example_two.dart';
import 'package:api/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ExampleFour(),
    );
  }
}
