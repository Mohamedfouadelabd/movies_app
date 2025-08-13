import 'package:movies_app/Browser/MoviesDiscover/domain/repository/movie_discover_response_contract.dart';
import 'package:movies_app/Browser/MoviesDiscover/repository/movie_discover_response_impl.dart';
import 'package:movies_app/model/Response/MovieDiscoverSurceResponse.dart';

class MovieDiscoverUseCase{
  MovieDiscoverResponseContract discoverResponseContract;

  MovieDiscoverUseCase({required this.discoverResponseContract});
Future <MovieDiscoverSourceResponse?>invoke(String id,{int page = 1}){
  return discoverResponseContract.getMovieDiscover(id,page: page);


}

}
MovieDiscoverUseCase injectMovieDiscoverUseCase(){
  return MovieDiscoverUseCase(discoverResponseContract: injectMovieDiscoverResponseContract());

}