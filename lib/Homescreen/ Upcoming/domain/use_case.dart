import 'package:movies_app/Homescreen/%20Upcoming/domain/reopsitory/upcoming_response_contract.dart';
import 'package:movies_app/Homescreen/%20Upcoming/repository/upcoming_response_contract.dart';
import 'package:movies_app/model/Response/UpComingSourceResponse.dart';

class UpcomingUseCase{
  UpcomingResponseContract responseContract;
  UpcomingUseCase({required this.responseContract});

Future<UpComingSourceResponse?>invoke(){
  return responseContract.getUpcomingResponse();

}

}
UpcomingUseCase injectUpcomingUseCase(){

return  UpcomingUseCase(responseContract: injectUpcomingResponseContract());

}
