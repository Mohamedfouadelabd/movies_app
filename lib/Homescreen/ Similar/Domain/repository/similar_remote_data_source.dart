import '../../../../model/Response/SimilarSourceResponse.dart';

abstract class SimilarRemoteDataSource{
  Future<SimilarSourceResponse ?> getSimilar(String movieId,{int page = 1});


}
