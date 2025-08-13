import 'package:movies_app/Browser/MovieList/domain/repository/movie_list_contract.dart';
import 'package:movies_app/Browser/MovieList/repository/movie_list_impl.dart';

import '../../../model/Response/MoveListSourceResponse.dart';

class MovieListUseCase{
  MovieListContract listContract;
  MovieListUseCase({required this.listContract});
Future <MoveListSourceResponse?>invoke(){
  return listContract.getMovieList();


}
}
MovieListUseCase injectMovieListUseCase(){
 return MovieListUseCase(listContract: injectMovieListContract());

}