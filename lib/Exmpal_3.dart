import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'models/User_models.dart';


class Exmpal3 extends StatefulWidget {
  const Exmpal3({Key? key}) : super(key: key);

  @override
  State<Exmpal3> createState() => _Exmpal3State();
}

class _Exmpal3State extends State<Exmpal3> {
  List<UserModels> userList = [] ;

   Future<List<UserModels>> getUserApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
          for(Map i in data){
            print(i['name']);
            userList.add(UserModels.fromJson(i));
          }
        return userList;
      }else{
        return userList;

      }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('api check'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context ,AsyncSnapshot<List<UserModels>> snapshot){
                    if(!snapshot.hasData){
                        return CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                    children: [
                                      ReusbaleRow(title: 'id', value: snapshot.data![index].id.toString()),
                                      ReusbaleRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                      ReusbaleRow(title: 'User Name', value: snapshot.data![index].username.toString()),
                                      ReusbaleRow(title: 'email', value: snapshot.data![index].email.toString()),
                                      ReusbaleRow(title: 'Address', value: snapshot.data![index].address!.street.toString()
                                          +'\n'+snapshot.data![index].address!.suite.toString()
                                          +'\n'+snapshot.data![index].address!.city.toString()
                                          +'\n'+snapshot.data![index].address!.zipcode.toString()
                                      ),
                                      ReusbaleRow(title: 'Geo', value: snapshot.data![index].address!.geo!.lat.toString()
                                          +"\n"+snapshot.data![index].address!.geo!.lng.toString()),
                                      ReusbaleRow(title: 'Phone', value: snapshot.data![index].phone.toString()),

                                      ReusbaleRow(title: 'Website', value: snapshot.data![index].website.toString()),

                                ReusbaleRow(title: 'Company', value: snapshot.data![index].company!.name.toString()
                                    +'\n'+snapshot.data![index].company!.catchPhrase.toString()
                                    +'\n'+snapshot.data![index].company!.bs.toString()
                                ),

                                  ],
                                ),
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
