import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import 'models/PostModels.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  List<PostModels> postList = [];
  Future<List<PostModels>>getPostApi () async{
    final resposne = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var  data = jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      for(Map i in data){
        postList.add(PostModels.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Api Check'),
      ),
    body: Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: getPostApi(),
              builder: (context, snapshot){
              if(!snapshot.hasData){
                return Text('Loading');
                 
              }else{
                return  
                ListView.builder(
                  itemCount: postList.length,
                    itemBuilder: (context, index) {
                         return Card(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("User Id",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                 Text(postList[index].userId.toString()),
                                 Text("Id",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                 Text(postList[index].id.toString()),
                                 Text("Title",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                 Text(postList[index].title.toString()),
                                 Text("Body",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                 Text(postList[index].body.toString()),

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
