import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greyColor = Color(0xff707070);
  static Color blackColor = Color(0xff303030);
  static Color redColor = Color(0xffe81809);
  static Color darkBlueColor = Color(0xff010da8);
  static Color pinkColor = Color(0xffe413f1);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
            titleMedium: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,

            ),
            titleSmall: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold,


            ),),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        activeIndicatorBorder: BorderSide.none
      )
      );
}
