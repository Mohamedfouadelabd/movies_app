import 'package:movies_app/Homescreen/Top%20Rated/domain/repository/toprated_response_contract.dart';
import 'package:movies_app/Homescreen/Top%20Rated/repository/rop_rated_response_Impl.dart';
import 'package:movies_app/model/Response/TopRatedSourceResponse.dart';

class TopRatedUseCase{
  TopRatedResponseContract responseContract;

  TopRatedUseCase({required this.responseContract});
  Future<TopRatedSourceResponse?> invoke({int page = 1}){
   return responseContract.getTopRatedResponse(page: page);
  }

}


TopRatedUseCase injectTopRatedUseCase(){
  return TopRatedUseCase(responseContract: injectTopRatedResponseContract());


}

