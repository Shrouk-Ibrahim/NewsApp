import 'package:news/home/model/SourceResponse.dart';

abstract class SourceStates{

}
class SourceLoadingState extends SourceStates{
  String? loadingMessage;
  SourceLoadingState({required this.loadingMessage});
}
class SourceErrorState extends SourceStates{
  String? errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourceStates{
  List<Source> sourceList ;
  SourceSuccessState({required this.sourceList});
}
class SourceInitialState extends SourceStates{}
