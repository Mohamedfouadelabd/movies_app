import 'package:movies_app/model/Response/SearchResponse.dart';

abstract class SearchResponseContract{
Future<SearchResponse?>  search(String query);



}