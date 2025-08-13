import 'package:movies_app/SearchScreen/Search/rpository/saerch_remote_data_source_impl.dart';
import 'package:movies_app/model/Response/SearchResponse.dart';

import '../domain/repository/saerch_remote_data_source.dart';
import '../domain/repository/search_response_contract.dart';

class SearchResponseImpl implements SearchResponseContract {
  SearchRemoteDataSource remoteDataSource;
  SearchResponseImpl({required this.remoteDataSource});
  @override
  Future<SearchResponse?> search(String query) {
  return remoteDataSource.search(query);
  }
}

SearchResponseContract injectSearchResponseContract(){
  return SearchResponseImpl(remoteDataSource: injectSearchRemoteDataSource());


}