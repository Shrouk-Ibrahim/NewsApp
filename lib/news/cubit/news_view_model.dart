import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api_manager.dart';
import 'package:news/news/cubit/states.dart';
import 'package:news/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news/repository/news/news_repository_contract.dart';
import 'package:news/repository/news/repository/news_repository_impl.dart';

class NewsViewModel extends Cubit<NewsState>{
   late NewsRepositoryContract repositoryContract ;
  late NewsRemoteDataSource remoteDataSource ;
   late ApiManager apiManager ;

  NewsViewModel():super(NewsLoadingState(loadingMessage: 'Loading..')){
  apiManager = ApiManager();
  remoteDataSource=NewsRemoteDataSourceImpl(apiManager: apiManager);
  repositoryContract = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }
void getNewsBySourceId(String sourceId)async{
try{
  emit(NewsLoadingState(loadingMessage: 'Loading...'));
emit(MessageState(message: 'Waiting'));

  var response = await  repositoryContract.getNewsBySourceId(sourceId);
if(response?.status == 'error'){
  emit(NewsErrorState(errorMessage: response!.message));
}
else {
  emit(NewsSuccessState(newsList: response!.articles!));
}
}catch (e){
emit(NewsErrorState(errorMessage: e.toString()));
}
}
}