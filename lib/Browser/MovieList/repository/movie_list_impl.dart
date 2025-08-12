import 'package:movies_app/Browser/MovieList/repository/movie_list_remote_data_source_Impl.dart';
import 'package:movies_app/model/Response/MoveListSourceResponse.dart';

import '../domain/repository/movie_list_contract.dart';
import '../domain/repository/movie_list_remote_data_source.dart';

class MovieListImpl implements MovieListContract{
  MovieListRemoteDataSource remoteDataSource;
  MovieListImpl({required this.remoteDataSource});
  @override
  Future<MoveListSourceResponse?> getMovieList() {
return remoteDataSource.getMovieList();
  }
}
MovieListContract injectMovieListContract(){
  return MovieListImpl(remoteDataSource: injectMovieListRemoteDataSource());

}