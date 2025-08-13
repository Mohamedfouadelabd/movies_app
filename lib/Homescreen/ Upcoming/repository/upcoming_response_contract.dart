import 'package:movies_app/Homescreen/%20Upcoming/repository/upcoming_remote_data_source.dart';
import 'package:movies_app/model/Response/UpComingSourceResponse.dart';

import '../domain/reopsitory/upcomig_remote_data_source.dart';
import '../domain/reopsitory/upcoming_response_contract.dart';

class UpcomingResponseContractImpl implements UpcomingResponseContract{
  UpcomingRemoteDataSource remoteDataSource;
  UpcomingResponseContractImpl({required this.remoteDataSource});
  @override
  Future<UpComingSourceResponse?> getUpcomingResponse() {
    return remoteDataSource.getUpcomingResponse();
  }
}
UpcomingResponseContract injectUpcomingResponseContract(){
  return UpcomingResponseContractImpl(remoteDataSource: injectUpcomingRemoteDataSource());

}