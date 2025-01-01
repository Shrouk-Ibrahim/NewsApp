import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api_manager.dart';
import 'package:news/home/model/NewsResponse.dart';
import 'package:news/home/model/SourceResponse.dart';
import 'package:news/home/myTheme.dart';
import 'package:news/news/cubit/news_view_model.dart';
import 'package:news/news/cubit/states.dart';
import 'package:news/news/news_container_view_model.dart';
import 'package:news/news/news_item.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();
  var viewModel2 = NewsViewModel();
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   viewModel.getNewsBySourceId(widget.source.id??"");
  //
  // }
  void initState() {
    // TODO: implement initState
    super.initState();
viewModel2.getNewsBySourceId(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel,NewsState>(
        bloc: viewModel2,
        builder: (context, state) {
          if(state is NewsLoadingState){
            return Center(
                      child: CircularProgressIndicator(color: MyTheme.primaryColor),
                    );
          }else if (state is NewsErrorState){
            return Column(
                      children: [
                        Text(state.errorMessage!),
                        ElevatedButton(
                            onPressed: () {
                             viewModel2.getNewsBySourceId(widget.source.id??"");
                            },
                            child: Text("Try Again"))
                      ],
                    );
          }else if(state is NewsSuccessState){
            return ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsItem(news: state.newsList[index]);

                      },
                      itemCount: state.newsList.length,
                    );
          }return Container();

        },);
    // return ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<NewsContainerViewModel>(
    //     builder: (context, viewModel, child) {
    //       if (viewModel.errorMessage != null) {
    //         return Column(
    //           children: [
    //             Text(viewModel.errorMessage!),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   viewModel.getNewsBySourceId(widget.source.id ?? "");
    //                 },
    //                 child: Text("Try Again"))
    //           ],
    //         );
    //       }else if (viewModel.newsList == null){
    //         return Center(
    //                     child: CircularProgressIndicator(color: MyTheme.primaryColor),
    //                   );
    //       }else {
    //         return ListView.builder(
    //                   itemBuilder: (context, index) {
    //                     return NewsItem(news: viewModel.newsList![index]);
    //
    //                   },
    //                   itemCount: viewModel.newsList!.length,
    //                 );
    //       }
    //     },
    //   ),
    // );
    /////////////////////////////////////////
    //   FutureBuilder<NewsResponse>(
    //   future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(color: MyTheme.primaryColor),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text("something went wrong"),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(widget.source.id ?? "",
    //
    //                 );
    //                 setState(() {
    //
    //                 });
    //               },
    //               child: Text("Try Again"))
    //         ],
    //       );
    //     }
    //     //response
    //     if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? "something went wrong"),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(widget.source.id ?? "");
    //                 setState(() {});
    //               },
    //               child: Text("Try Again"))
    //         ],
    //       );
    //     }
    //     var newsList = snapshot.data?.articles ?? [];
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsItem(news: newsList[index]);
    //
    //       },
    //       itemCount: newsList.length,
    //     );
    //
    //   },
    // );
  }
}
