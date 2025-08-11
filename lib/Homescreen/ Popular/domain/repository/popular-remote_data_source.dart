import 'package:movies_app/model/Response/PopularSourceResponse.dart';

abstract class PopularRemoteDataSource{
 Future<PopularSourceResponse?> getPopularResponse();


}