import 'package:movies_app/Homescreen/%20Similar/Domain/repository/similar_responde_contract.dart';
import 'package:movies_app/Homescreen/%20Similar/repository/similar_response_Impl.dart';
import 'package:movies_app/model/Response/SimilarSourceResponse.dart';

class SimilarUseCase {
  SimilarResponseContract responseContract;
  SimilarUseCase({required this.responseContract});

  Future<SimilarSourceResponse?> invoke(String movieId,{int page = 1}) {
    return responseContract.getSimilar(movieId,page: page);
  }
}

SimilarUseCase injectSimilarUseCase() {
  return SimilarUseCase(responseContract: injectSimilarResponseContract());
}
