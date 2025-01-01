import 'package:news/home/model/SourceResponse.dart';
import 'package:news/repository/source/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSource remoteDataSource ;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSourceByCategoryId(String categoryId) {
return remoteDataSource.getSourceByCategoryId(categoryId);
  }

}