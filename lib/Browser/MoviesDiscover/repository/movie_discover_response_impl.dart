import 'package:movies_app/Browser/MoviesDiscover/repository/movie_discover_remote_data_source_impl.dart';
import 'package:movies_app/model/Response/MovieDiscoverSurceResponse.dart';

import '../domain/repository/movie_discover_remote_data_source.dart';
import '../domain/repository/movie_discover_response_contract.dart';

class MovieDiscoverResponseImpl implements MovieDiscoverResponseContract{
  MovieDiscoverRemoteDataSource remoteDataSource;
  MovieDiscoverResponseImpl({required this.remoteDataSource});
  @override
  Future<MovieDiscoverSourceResponse?> getMovieDiscover(String id,{int page = 1}) {
   return remoteDataSource.getMovieDiscover(id,page: page);

  }


}
MovieDiscoverResponseContract injectMovieDiscoverResponseContract(){

  return MovieDiscoverResponseImpl(remoteDataSource: injectMovieDiscoverRemoteDataSource());

}