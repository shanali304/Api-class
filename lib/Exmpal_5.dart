import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'models/Products_model.dart';


class Exmpal5 extends StatefulWidget {
  const Exmpal5({Key? key}) : super(key: key);

  @override
  State<Exmpal5> createState() => _Exmpal5State();
}

class _Exmpal5State extends State<Exmpal5> {
    Future<ProductsModel> getProductsApi() async{
      final response = await http.get(Uri.parse('https://webhook.site/366e3741-eae5-4308-ac7a-e2a7b619c17b'));
      print(response.statusCode);

      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        return ProductsModel.fromJson(data);
      }else{
        return ProductsModel.fromJson(data);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api coures"),
      ),
      body:
       Column(
        children: [
            Expanded(
                child: FutureBuilder<ProductsModel>(
                  future: getProductsApi(),
                  builder: (context, snapshot){
                   if(!snapshot.hasData){
                     return ListView.builder(
                         itemCount: snapshot.data!.data!.length,
                         itemBuilder: (context, index){
                           return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                              Text(index.toString()),
                            //  Container(
                            //    height: MediaQuery.of(context).size.height *.3,
                            //    width: MediaQuery.of(context).size.width * 1,
                            //    child: ListView.builder(
                            //         itemCount:  snapshot.data!.data![index].images!.length,
                            //        itemBuilder: (context,  position){
                            //          return Container(
                            //            height: MediaQuery.of(context).size.height *.25,
                            //            width: MediaQuery.of(context).size.width * .5,
                            //             decoration: BoxDecoration(
                            //               image: DecorationImage
                            //               (image: NetworkImage(snapshot.data!.data![index].images![position].url.toString() ,
                            //               )
                            //             ),
                            //             )
                            //          );
                            //        }
                            //    ),
                            //  )
                             ],
                           );
                         });
                   }else{
                     return Text("Loading");
                   }
                  }
                )
            )
        ],
      ),
    );
  }
}


//  Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder<ProductsModel>(
//                 future: getProductsApi (),
//                 builder: (context , snapshot){
//                     print(snapshot);
//                   if(snapshot.hasData){
                    
//                     return ListView.builder(
//                         itemCount: snapshot.data!.data!.length,
//                         itemBuilder: (context, index){
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ListTile(
//                                 title: Text(snapshot.data!.data![index].shop!.name.toString()),
//                                 subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
//                                 leading: CircleAvatar(
//                                   backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
//                                 ),
//                               ),
//                               Container(
//                                 height: MediaQuery.of(context).size.height *.3,
//                                 width: MediaQuery.of(context).size.width * 1,
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: snapshot.data!.data![index].images!.length,
//                                     itemBuilder: (context, position){
//                                   return Padding(
//                                     padding: const EdgeInsets.only(right: 10),
//                                     child: Container(
//                                       height: MediaQuery.of(context).size.height *.25,
//                                       width: MediaQuery.of(context).size.width * .5,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: NetworkImage(snapshot.data!.data![index].images![position].url.toString())
//                                         )
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                               ),
//                             ],
//                           );
//                         });
//                   }else {
//                     return Text('Loading');
//                   }
//                 },
//               ),
//             )
//           ],
//         ),
//       ),