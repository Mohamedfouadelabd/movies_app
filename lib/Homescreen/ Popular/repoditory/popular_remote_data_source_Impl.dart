import 'package:movies_app/Api/api_manger.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';
import '../domain/repository/popular-remote_data_source.dart';

class PopularRemoteDataSourceImpl implements PopularRemoteDataSource {
  ApiManger apiManger;
  PopularRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<PopularSourceResponse?> getPopularResponse({int page = 1}) async {
    var response = await apiManger.getPopularResponse(page: page);
    return response;
  }
}

PopularRemoteDataSource injectPopularRemoteDataSource() {
  return PopularRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());
}
