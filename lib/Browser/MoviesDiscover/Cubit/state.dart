import 'package:movies_app/model/Response/MovieDiscoverSurceResponse.dart';

abstract class MovieDiscoverState{}
class MovieDiscoverLoadingState extends MovieDiscoverState {}
class MovieDiscoverErrorState extends MovieDiscoverState{
  String errorMassage;
  MovieDiscoverErrorState({required this.errorMassage});

}
class MovieDiscoverSucssesState extends MovieDiscoverState{
  MovieDiscoverSourceResponse? response;
  MovieDiscoverSucssesState({required this.response});
}
