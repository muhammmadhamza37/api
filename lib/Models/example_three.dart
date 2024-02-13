import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'UserModel.dart';


class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List<UserModel> userlist = [];
  Future<List<UserModel>> getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode ==200 ){

      for(Map i in data){
        userlist.add(UserModel.fromJson(i));
      }
     return userlist;
    }else{
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
           Expanded(
             child: FutureBuilder(
               future: getUserApi(),
               builder: (context,AsyncSnapshot<List<UserModel>>snapshot) {
                 
                 if(!snapshot.hasData){
                   return CircularProgressIndicator();
                 }else{
                   return ListView.builder(
                       itemCount: userlist.length,
                       itemBuilder: (context, index) {
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Card(
                             child: Column(
                                children: [
                                  ReuseableRow(title: 'Name', value:snapshot.data![index].name.toString()),
                                  ReuseableRow(title: 'username', value:snapshot.data![index].username.toString()),
                                  ReuseableRow(title: 'email', value:snapshot.data![index].email.toString()),
                                  ReuseableRow(title: 'Address', value:snapshot.data![index].address!.city.toString()),



                                ],
                             ),
                           ),
                         );
                       });

                 }
               }
           ),
    ) 
        ],
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {

  String title, value;
   ReuseableRow({Key? key,required this.title , required this.value}) : super(key: key );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
