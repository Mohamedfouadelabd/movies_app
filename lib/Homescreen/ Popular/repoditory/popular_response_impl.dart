import 'package:movies_app/Homescreen/%20Popular/domain/repository/popular-remote_data_source.dart';
import 'package:movies_app/Homescreen/%20Popular/domain/repository/popular_response_contract.dart';
import 'package:movies_app/Homescreen/%20Popular/repoditory/popular_remote_data_source_Impl.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';

class PopularResponseImpl implements PopularResponseContract{
  PopularRemoteDataSource remoteDataSource;
  PopularResponseImpl({required this.remoteDataSource});
  @override
  Future<PopularSourceResponse?> getPopularResponse({int page = 1}) {
   return remoteDataSource.getPopularResponse(page:page );

  }



}

PopularResponseContract injectPopularResponseContract(){
  return PopularResponseImpl(remoteDataSource: injectPopularRemoteDataSource());


}
