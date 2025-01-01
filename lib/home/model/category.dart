import 'package:flutter/material.dart';
import 'package:news/home/myTheme.dart';

class Category {
  String id;
  String title;
  String imageUrl;
  Color color;
  Category(
      {required this.id,
      required this.color,
      required this.title,
      required this.imageUrl});
  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          color: MyTheme.redColor,
          title: 'Sports',
          imageUrl: 'assets/images/sports.png'),
      Category(
          id: 'general',
          color: MyTheme.darkBlueColor,
          title: 'General',
          imageUrl: 'assets/images/politics.png'),
      Category(
          id: 'health',
          color: MyTheme.pinkColor,
          title: 'Health',
          imageUrl: 'assets/images/health.png'),
      Category(
          id: 'business',
          color: MyTheme.brownColor,
          title: 'Business',
          imageUrl: 'assets/images/bussines.png'),
      Category(
          id: 'entertainment',
          color: MyTheme.blueColor,
          title: 'entertainment',
          imageUrl: 'assets/images/environment.png'),
      Category(
          id: 'science',
          color: MyTheme.yellowColor,
          title: 'Science',
          imageUrl: 'assets/images/science.png'),
    ];
  }
}
