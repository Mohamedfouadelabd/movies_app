import '../../../../model/Response/MoveListSourceResponse.dart';

abstract class MovieListRemoteDataSource{
  Future<MoveListSourceResponse?> getMovieList();

}








