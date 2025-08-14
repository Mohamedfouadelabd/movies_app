import 'package:movies_app/model/Response/UpComingSourceResponse.dart';

abstract class UpcomingResponseContract{

 Future<UpComingSourceResponse?> getUpcomingResponse({int page = 1});

}