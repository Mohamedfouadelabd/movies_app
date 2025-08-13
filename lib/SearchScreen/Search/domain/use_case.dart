
import 'package:movies_app/SearchScreen/Search/domain/repository/search_response_contract.dart';
import 'package:movies_app/model/Response/SearchResponse.dart';

import '../rpository/search_response_imp;t.dart';

class SearchUseCase{
  SearchResponseContract responseContract;
  SearchUseCase({required this.responseContract});

Future <SearchResponse?>invoke(String query){
  return responseContract.search(query);

}

}

SearchUseCase injectSearchUseCase(){
  return SearchUseCase(responseContract:  injectSearchResponseContract());

}