import 'package:movies_app/model/Response/MovieDiscoverSurceResponse.dart';

abstract class MovieDiscoverResponseContract{

  Future <MovieDiscoverSourceResponse?>getMovieDiscover(String id,{int page = 1});

}