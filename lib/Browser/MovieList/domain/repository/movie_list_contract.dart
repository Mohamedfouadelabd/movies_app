import '../../../../model/Response/MoveListSourceResponse.dart';

abstract class MovieListContract{
  Future<MoveListSourceResponse?> getMovieList();
}