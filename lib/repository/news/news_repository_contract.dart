import 'package:news/home/model/NewsResponse.dart';

abstract class NewsRepositoryContract{
 Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
abstract class NewsRemoteDataSource{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);


}

abstract class NewsOfflineDataSource{
  Future<NewsResponse> getNewsBySourceId(String sourceId);

}