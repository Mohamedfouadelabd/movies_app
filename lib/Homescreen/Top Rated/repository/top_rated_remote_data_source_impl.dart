import 'package:movies_app/Api/api_manger.dart';
import 'package:movies_app/model/Response/TopRatedSourceResponse.dart';

import '../domain/repository/toprated_remote_data_source.dart';

class TopRatedRemoteDataSourceImpl implements TopRatedRemoteDataSource{
 ApiManger apiManger ;
 TopRatedRemoteDataSourceImpl({required this.apiManger});
 @override
  Future<TopRatedSourceResponse?> getTopRatedResponse({int page = 1}) async{
    var response=await apiManger.getTopRatedResponse(page: page);
    return response;
  }


}
TopRatedRemoteDataSource injectTopRatedRemoteDataSource(){
  return TopRatedRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());



}