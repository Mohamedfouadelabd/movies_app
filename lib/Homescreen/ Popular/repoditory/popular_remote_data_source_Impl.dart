import 'package:movies_app/Api/api_manger.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';

import '../domain/repository/popular-remote_data_source.dart';

class PopularRemoteDataSourceImpl implements PopularRemoteDataSource{
 ApiManger apiManger;
 PopularRemoteDataSourceImpl({required this.apiManger});
 @override
  Future<PopularSourceResponse?> getPopularResponse()async {
var response=await apiManger.getPopularResponse();
  return response;
 }


}
PopularRemoteDataSource injectPopularRemoteDataSource(){
  return PopularRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}