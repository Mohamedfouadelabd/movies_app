import '../../../../model/Response/SimilarSourceResponse.dart';

abstract class SimilarResponseContract{
  Future<SimilarSourceResponse ?> getSimilar(String movieId,{int page = 1});



}