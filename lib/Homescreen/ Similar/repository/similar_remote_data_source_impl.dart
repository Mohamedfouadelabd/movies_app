import 'package:movies_app/model/Response/SimilarSourceResponse.dart';

import '../../../Api/api_manger.dart';
import '../Domain/repository/similar_remote_data_source.dart';

class SimilarRemoteDataSourceImpl  implements SimilarRemoteDataSource{
ApiManger apiManger;
SimilarRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SimilarSourceResponse?> getSimilar(String movieId,{int page = 1}) async{
var response=await apiManger.getSimilarResponse(movieId,page: page);
 return response;
  }



}

SimilarRemoteDataSource injectSimilarRemoteDataSource(){
  return SimilarRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());


}