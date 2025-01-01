import 'package:news/api_manager.dart';
import 'package:news/home/model/NewsResponse.dart';
import 'package:news/repository/news/news_repository_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId)async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response ;

  }
}
