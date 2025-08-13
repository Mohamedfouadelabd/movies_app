import '../../../../model/Response/PopularSourceResponse.dart';

abstract class PopularResponseContract{
  Future<PopularSourceResponse?> getPopularResponse();
}