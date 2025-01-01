import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/home/model/NewsResponse.dart';
import 'package:news/home/myTheme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
static const String routeName = 'news_details' ;
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News ;
 return Scaffold(
appBar: AppBar(),
  body: Container(
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: CachedNetworkImage(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.fill,
            imageUrl: news.urlToImage ?? "",
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryColor,
                )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(news.author ?? "",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: MyTheme.greyColor)),
        Text(news.title ?? "", style: Theme.of(context).textTheme.titleSmall),
        SizedBox(
          height: 15,
        ),
        Text(news.content??""),
        SizedBox(
          height: 15,
        ),
        Text(news.publishedAt ?? "",
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: MyTheme.greyColor)),
        SizedBox(
          height: 24,
        ),

        InkWell(
          onTap: ()=>launchNewsUrl(news.url??""),
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('View Ful Article ',style: TextStyle(
                color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500
              )),
              Icon(Icons.arrow_forward_ios ,size: 16,)
            ],
          ),
        )


      ],
    ),
  ),


);

  }
Future<void> launchNewsUrl(String url) async {
    var uri =Uri.parse(url);
  await launchUrl(uri) ;
}
}
