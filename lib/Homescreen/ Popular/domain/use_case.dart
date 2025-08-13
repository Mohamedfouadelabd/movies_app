import 'package:movies_app/Homescreen/%20Popular/domain/repository/popular_response_contract.dart';
import 'package:movies_app/Homescreen/%20Popular/repoditory/popular_response_impl.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';

class PopularUseCase{
  PopularResponseContract responseContract;
  PopularUseCase({required this.responseContract});
  Future<PopularSourceResponse?> invoke(){
    return responseContract.getPopularResponse();

  }


}

PopularUseCase injectPopularUseCase(){
return  PopularUseCase(responseContract: injectPopularResponseContract());

}