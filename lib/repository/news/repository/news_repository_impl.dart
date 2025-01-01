import 'package:news/home/model/NewsResponse.dart';
import 'package:news/repository/news/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract{
  NewsRemoteDataSource remoteDataSource ;
  NewsRepositoryImpl({required this.remoteDataSource,});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
 return remoteDataSource.getNewsBySourceId(sourceId);
  }



}