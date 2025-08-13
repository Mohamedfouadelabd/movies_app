import 'package:movies_app/model/Response/SearchResponse.dart';

abstract class SearchRemoteDataSource{
  Future<SearchResponse?>  search(String query);



}