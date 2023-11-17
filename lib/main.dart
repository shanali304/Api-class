import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Exmpal_2.dart';
import 'Exmpal_5.dart';
import 'Signup.dart';
import 'home.dart';
import 'pracitecs/one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "api Demo",
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
