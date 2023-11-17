import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Exmpal_4 extends StatefulWidget {
  const Exmpal_4({Key? key}) : super(key: key);

  @override
  State<Exmpal_4> createState() => _Exmpal_4State();
}

class _Exmpal_4State extends State<Exmpal_4> {

   var data;
   Future<void>getUserApi ()async{
     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

     if(response.statusCode == 200){
       data =jsonDecode(response.body.toString());
     }else{

     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api Coures"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text("loading");
                  }else{
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [
                                  ReusbaleRow(title: 'name', value: data[index]['name'].toString()),
                                ReusbaleRow(title: 'username', value: data[index]['username'].toString()),
                                ReusbaleRow(title: 'Address', value: data[index]['address']['street'].toString()),
                                ReusbaleRow(title: 'Geo', value: data[index]['address']['geo']['lat'].toString()),

                              ],
                            ),
                          );
                        }
                    );
                  }
                }
              )

          )
        ],
      ),
    );
  }
}
class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key, required this.title,required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value)
        ],
      ),
    );
  }
}