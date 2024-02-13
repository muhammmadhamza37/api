import 'dart:convert';

import 'package:api/Models/example_three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void>getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future:  getUserApi(),
              builder: (context , snapshot){

                if(snapshot.connectionState == ConnectionState.waiting){
                  return Text('Loading');
                }else{
                  return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context, index){
                      return Card(
                      child: Column(
                        children: [
                          ReuseableRow(title: 'name', value: data[index]['name'].toString(),),
                          ReuseableRow(title: 'username', value: data[index]['username'].toString(),),
                          ReuseableRow(title: 'email', value: data[index]['email'].toString(),),
                          ReuseableRow(title: 'Lat', value: data[index]['address']['geo']['lat'].toString(),),
                          ReuseableRow(title: 'Lat', value: data[index]['address']['geo']['lng'].toString(),),

                        ],
                      ),
                      );
                });

                }
              },
            ),
          )
        ],
      ),
    );
  }
}
