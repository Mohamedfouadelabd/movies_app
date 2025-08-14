import '../../../../model/Response/UpComingSourceResponse.dart';

abstract class UpcomingRemoteDataSource{
  Future<UpComingSourceResponse?> getUpcomingResponse({int page = 1});

}