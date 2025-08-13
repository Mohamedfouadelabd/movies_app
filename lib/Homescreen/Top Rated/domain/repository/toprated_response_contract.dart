import 'package:movies_app/model/Response/TopRatedSourceResponse.dart';

abstract class TopRatedResponseContract{
  Future <TopRatedSourceResponse?>getTopRatedResponse({int page = 1});

}