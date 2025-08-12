import 'package:movies_app/Api/api_manger.dart';
import 'package:movies_app/model/Response/MoveListSourceResponse.dart';

import '../domain/repository/movie_list_remote_data_source.dart';

class MovieListRemoteDataSourceImpl implements MovieListRemoteDataSource{
  ApiManger apiManger ;
  MovieListRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<MoveListSourceResponse?> getMovieList() async{
  var response= await apiManger.getMovieList();
 return response;
  }

}

MovieListRemoteDataSource injectMovieListRemoteDataSource(){
 return MovieListRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());


}