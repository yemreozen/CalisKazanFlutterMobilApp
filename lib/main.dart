import 'package:calistakazan/screens/menulist.dart';
import 'package:calistakazan/untiteils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Çalış Kazan',
      theme: ThemeData(
      primarySwatch: Colors.orange,
        fontFamily: "Oswald"
      ),
      debugShowCheckedModeBanner: false,

      home:MenuList(),
      routes: Routes.routes,


    );
  }
}


