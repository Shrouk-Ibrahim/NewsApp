import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api_manager.dart';
import 'package:news/category_details/category_details_view_model.dart';
import 'package:news/category_details/cubit/category_view_model.dart';
import 'package:news/category_details/cubit/states.dart';
import 'package:news/home/model/SourceResponse.dart';
import 'package:news/home/model/category.dart';
import 'package:news/tabs/tab_contairner.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   viewModel.getSourceByCategory(widget.category.id);
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel2.getSourceByCategoryId(widget.category.id);
  }
  CategoryViewModel viewModel2 = CategoryViewModel() ;
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<CategoryViewModel,SourceStates>(
bloc: viewModel2,
         builder: (context, state) {
           if(state is SourceLoadingState){
             return Center(
                           child: CircularProgressIndicator(
                             color: Theme.of(context).primaryColor,
                           ),
                         );
           }else if(state is SourceErrorState){
             return Column(
                         children: [
                           Text(state.errorMessage!),
                           ElevatedButton(
                               onPressed: () {
                              viewModel2.getSourceByCategoryId(widget.category.id);
                               },
                               child: Text('try again'))
                         ],
                       );
           }else if (state is SourceSuccessState){
             return TabContainer(sourcesList: state.sourceList);
           }
           return Container();
         },);
//////////////////////////////////////////////////////
    // ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<CategoryDetailsViewModel>(
    //     builder: (context, viewModel, child) {
    //       if (viewModel.errorMessage != null) {
    //         return Column(
    //           children: [
    //             Text(viewModel.errorMessage!),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   viewModel.getSourceByCategory(widget.category.id);
    //                 },
    //                 child: Text('try again'))
    //           ],
    //         );
    //       } else if (viewModel.sourceList == null) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       }else{
    //         return TabContainer(sourcesList: viewModel.sourceList!);
    //       }
    //     },
    //   ),
    // );
    //   FutureBuilder<SourceResponse>(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text("something went wrong "),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id
    //                 );
    //                 setState(() {});
    //               },
    //               child: Text('try again'))
    //         ],
    //       );
    //     }
    //
    //     ///response
    //     if (snapshot.data?.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? ""),
    //           ElevatedButton(onPressed: () {
    //             ////////////////////////////////////////
    //
    //           }, child: Text('Try Again'))
    //         ],
    //       );
    //     }
    //     var sourceList = snapshot.data?.sources ?? [];
    //     return TabContainer(sourcesList: sourceList);
    //   },
    // );
  }
}
