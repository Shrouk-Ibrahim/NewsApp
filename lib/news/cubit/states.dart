import 'package:news/home/model/NewsResponse.dart';

abstract class NewsState{}

class NewsLoadingState extends NewsState{

  String? loadingMessage ;
  NewsLoadingState({required this.loadingMessage});
}
class MessageState extends NewsState{
  String? message ;
  MessageState({required this.message});
}

class NewsErrorState extends NewsState{
  String? errorMessage ;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsState{
  List<News> newsList ;
  NewsSuccessState({required this.newsList});
}

