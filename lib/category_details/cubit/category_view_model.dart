import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api_manager.dart';
import 'package:news/category_details/cubit/states.dart';
import 'package:news/repository/source/data_source/source_remote_data_source_impl.dart';
import 'package:news/repository/source/repository/source_repository_impl.dart';
import 'package:news/repository/source/source_repository_contract.dart';

class CategoryViewModel extends Cubit<SourceStates> {
 late SourceRepositoryContract repositoryContract ;
  late SourceRemoteDataSource remoteDataSource ;
  late ApiManager apiManager ;
  CategoryViewModel() : super(SourceLoadingState(loadingMessage: 'Loading ...')){
apiManager =ApiManager() ;
    remoteDataSource =SourceRemoteDataSourceImpl(apiManager: apiManager);
    repositoryContract = SourceRepositoryImpl(remoteDataSource: remoteDataSource);

  }
 void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState(loadingMessage: 'Loadng...'));
      var response = await repositoryContract.getSourceByCategoryId(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message));
      } else {
        emit(SourceSuccessState(sourceList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
