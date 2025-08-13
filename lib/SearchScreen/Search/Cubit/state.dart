import 'package:movies_app/model/Response/SearchResponse.dart';

abstract class SearchState{}
class SearchLoadingState extends SearchState{}
class SearchErrorState extends SearchState{
  String ?errorMassage;
  SearchErrorState({required this.errorMassage});
}
class SearchSucssesState extends SearchState{
  SearchResponse ?response;
  SearchSucssesState({required this.response});

}