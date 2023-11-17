import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class oneparites extends StatefulWidget {
  const oneparites({super.key});

  @override
  State<oneparites> createState() => _oneparitesState();
}

class _oneparitesState extends State<oneparites> {
  List<myPic> picList = [];
  Future<List<myPic>> getpic() async {
    final respone = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(respone.body.toString());
    if (respone.statusCode == 200) {
      for (Map i in data) {
        myPic Pic = myPic(titile: i['title'], url: i['url'], id: i['id']);
        picList.add(Pic);
      }
      return picList;
    } else {
      return picList;
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
                  future: getpic(),
                  builder: (context, AsyncSnapshot<List<myPic>> snapshot) {
                    return ListView.builder(
                      itemCount: picList.length,
                      itemBuilder: (context, index) {
                        return
                            //  Column(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Image.network(
                            //           snapshot.data![index].url.toString(),
                            //           width: 100,
                            //           height: 100,
                            //         ),
                            //       ],
                            //     ),
                            //     Row(
                            //       children: [
                            //         Text(
                            //           snapshot.data![index].id.toString(),
                            //         )
                            //       ],
                            //     )
                            //   ],
                            // );
                            ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          title: Text(snapshot.data![index].titile.toString()),
                          subtitle: Text('Notes Id:' +
                              snapshot.data![index].id.toString()),
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }
}

class myPic {
  String titile, url;
  int id;
  myPic({required this.titile, required this.url, required this.id});
}
