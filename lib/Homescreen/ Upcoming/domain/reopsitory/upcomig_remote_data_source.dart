import '../../../../model/Response/UpComingSourceResponse.dart';

abstract class UpcomingRemoteDataSource{
  Future<UpComingSourceResponse?> getUpcomingResponse();

}