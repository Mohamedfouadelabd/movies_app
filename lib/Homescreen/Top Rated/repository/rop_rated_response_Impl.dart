import 'package:movies_app/Homescreen/Top%20Rated/repository/top_rated_remote_data_source_impl.dart';
import 'package:movies_app/model/Response/TopRatedSourceResponse.dart';

import '../domain/repository/toprated_remote_data_source.dart';
import '../domain/repository/toprated_response_contract.dart';

class TopRatedResponseImpl implements TopRatedResponseContract{
  TopRatedRemoteDataSource remoteDataSource;
  TopRatedResponseImpl({required this.remoteDataSource});
  @override
  Future<TopRatedSourceResponse?> getTopRatedResponse() {
   return  remoteDataSource.getTopRatedResponse();
  }


}
TopRatedResponseContract injectTopRatedResponseContract(){
  return
    TopRatedResponseImpl(remoteDataSource: injectTopRatedRemoteDataSource());

}