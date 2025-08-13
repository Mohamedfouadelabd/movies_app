import 'package:movies_app/Homescreen/%20Similar/repository/similar_remote_data_source_impl.dart';
import 'package:movies_app/model/Response/SimilarSourceResponse.dart';

import '../Domain/repository/similar_remote_data_source.dart';
import '../Domain/repository/similar_responde_contract.dart';

class SimilarResponseImpl implements SimilarResponseContract{
  SimilarRemoteDataSource remoteDataSource;
  SimilarResponseImpl({required this.remoteDataSource});
  @override
  Future<SimilarSourceResponse?> getSimilar(String movieId,{int page = 1}) {
    // TODO: implement getSimilar
    return remoteDataSource.getSimilar(movieId,page: page);
  }

}
SimilarResponseContract injectSimilarResponseContract(){
 return SimilarResponseImpl(remoteDataSource: injectSimilarRemoteDataSource());


}
