import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class LastExampleGet extends StatefulWidget {
  const LastExampleGet({Key? key}) : super(key: key);

  @override
  State<LastExampleGet> createState() => _LastExampleGetState();
}

class _LastExampleGetState extends State<LastExampleGet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
