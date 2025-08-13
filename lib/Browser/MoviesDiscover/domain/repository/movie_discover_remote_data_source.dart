import '../../../../model/Response/MovieDiscoverSurceResponse.dart';

abstract class MovieDiscoverRemoteDataSource{
  Future <MovieDiscoverSourceResponse?>getMovieDiscover(String id);

}