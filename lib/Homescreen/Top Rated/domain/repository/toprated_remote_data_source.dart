

import '../../../../model/Response/TopRatedSourceResponse.dart';

abstract class TopRatedRemoteDataSource{
  Future <TopRatedSourceResponse?>getTopRatedResponse({int page = 1});
}