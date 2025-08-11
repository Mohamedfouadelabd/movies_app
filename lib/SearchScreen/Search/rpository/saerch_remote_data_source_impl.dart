import 'package:movies_app/Api/api_manger.dart';
import 'package:movies_app/model/Response/SearchResponse.dart';

import '../domain/repository/saerch_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
 ApiManger apiManger;
 SearchRemoteDataSourceImpl({required this.apiManger});
 @override
  Future<SearchResponse?> search(String query)async {
  var response=await apiManger.searchMovies(query);
  return response;
  }

}


SearchRemoteDataSource injectSearchRemoteDataSource(){
  return SearchRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}