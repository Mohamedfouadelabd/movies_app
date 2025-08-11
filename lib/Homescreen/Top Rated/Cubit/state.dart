import 'package:movies_app/model/Response/TopRatedSourceResponse.dart';

abstract class TopRatedState{}
class TopRatedLoadingState extends TopRatedState {}
class TopRatedErrorState extends TopRatedState{
  String? errorMassage;
  TopRatedErrorState({required this.errorMassage});
}
class TopRatedSucssesState extends TopRatedState{
  TopRatedSourceResponse? response;
  TopRatedSucssesState({required this.response});
}