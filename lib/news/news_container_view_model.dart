import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/home/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier{
late ApiManager apiManager;
List<News>? newsList ;
String? errorMessage ;
void getNewsBySourceId(String sourceId)async{
  errorMessage = null ;
  newsList = null ;
  notifyListeners() ;
try{

  var response= await apiManager.getNewsBySourceId(sourceId);
if(response.message =='error'){
  errorMessage = response.message;

}else{
  newsList= response.articles;
}
}catch(e){
errorMessage = 'Error Loading News List ';
}
notifyListeners();
}
}