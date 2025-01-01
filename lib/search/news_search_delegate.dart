import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/home/model/NewsResponse.dart';
import 'package:news/home/myTheme.dart';
import 'package:news/news/news_item.dart';

class NewsSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: ()=>showResults(context)

    , icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: ()=>Navigator.of(context).pop(),
       icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
   return buildSuggestions(context);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(child: Text('Sugesstion'),);
    }

    return FutureBuilder<NewsResponse?>(
      future: ApiManager.searchArticle(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: MyTheme.primaryColor),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("something went wrong"),
              ElevatedButton(
                  onPressed: () {


                  },
                  child: Text("Try Again"))
            ],
          );
        }
        //response
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? "something went wrong"),
              ElevatedButton(
                  onPressed: () {


                  },
                  child: Text("Try Again"))
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);

          },
          itemCount: newsList.length,
        );

      },
    );


  }
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return MyTheme.lightTheme;
  }
  
}