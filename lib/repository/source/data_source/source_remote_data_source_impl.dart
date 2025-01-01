import 'package:news/api_manager.dart';
import 'package:news/home/model/SourceResponse.dart';
import 'package:news/repository/source/source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager ;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSourceByCategoryId(String categoryId)async {
var respone = await apiManager.getSources(categoryId);
return respone ;

  }


}