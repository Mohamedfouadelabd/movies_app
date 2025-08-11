import 'package:movies_app/Api/api_manger.dart';
import 'package:movies_app/model/Response/UpComingSourceResponse.dart';

import '../domain/reopsitory/upcomig_remote_data_source.dart';

class UpcomingRemoteDataSourceImpl implements UpcomingRemoteDataSource{
  ApiManger apiManger;
  UpcomingRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<UpComingSourceResponse?> getUpcomingResponse() async{
    var response=await apiManger.getUpcomingResponse();
      return response;
    }
  }

UpcomingRemoteDataSource injectUpcomingRemoteDataSource(){

return  UpcomingRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}