import 'package:movies_app/model/Response/PopularSourceResponse.dart';

abstract class PopularRemoteDataSource {
 Future<PopularSourceResponse?> getPopularResponse({int page = 1});
}
