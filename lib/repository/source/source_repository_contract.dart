import 'package:news/home/model/SourceResponse.dart';

abstract class SourceRepositoryContract{
Future<SourceResponse?>  getSourceByCategoryId(String categoryId);
}
abstract class SourceRemoteDataSource{
  Future<SourceResponse?>  getSourceByCategoryId(String categoryId);

}
abstract class SourceOfflineDataSource{

}