import 'package:calcolator/calcolator.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Calcolator.routeName,
      routes: {
        Calcolator.routeName :(context) => Calcolator(),
      },
    );
  }

}

