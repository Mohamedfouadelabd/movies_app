import '../../../model/Response/MoveListSourceResponse.dart';

abstract class MovieListState{}
class MovieListLoadingState extends MovieListState {}
class MovieListErrorState extends MovieListState {
  String? errorMassage;
  MovieListErrorState({required this.errorMassage});
}
class MovieListSucssesState extends MovieListState {
  MoveListSourceResponse? response;
  MovieListSucssesState({required this.response});

}