import 'package:movies_app/Api/api_manger.dart';
import 'package:movies_app/model/Response/MovieDiscoverSurceResponse.dart';

import '../domain/repository/movie_discover_remote_data_source.dart';

class MovieDiscoverRemoteDataSourceImpl implements MovieDiscoverRemoteDataSource{
  ApiManger apiManger;
  MovieDiscoverRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<MovieDiscoverSourceResponse?> getMovieDiscover(String id)async {
    var response=await apiManger.getMovieDiscover(id);
  return response;
  }


}
MovieDiscoverRemoteDataSource injectMovieDiscoverRemoteDataSource(){
 return MovieDiscoverRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}