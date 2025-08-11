import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/Api/api-const.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';
import 'package:movies_app/model/Response/SearchResponse.dart';
import 'package:movies_app/model/Response/SimilarSourceResponse.dart';
import 'package:movies_app/model/Response/TopRatedSourceResponse.dart';
import 'package:movies_app/model/Response/UpComingSourceResponse.dart';

class ApiManger {
  ApiManger._();

  static ApiManger? _instance;

  static ApiManger getApiInstance() {
    _instance ??= ApiManger._();
    return _instance!;
  }

  Future<PopularSourceResponse?> getPopularResponse() async {
/*

https://api.themoviedb.org/3/movie/popular
 */
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiConst.baseUrl, ApiConst.popularUrl, {'api_key': ApiConst.apiKey});
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }


  Future<TopRatedSourceResponse?> getTopRatedResponse() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiConst.baseUrl, ApiConst.topRateUrl, {'api_key': ApiConst.apiKey});
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<UpComingSourceResponse?> getUpcomingResponse() async {
/*

https://api.themoviedb.org/3/movie/upcoming
 */
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiConst.baseUrl, ApiConst.UpComing, {'api_key': ApiConst.apiKey});
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return UpComingSourceResponse.fromJson(json);
    } else {
      print('No internet connection');

      return null;
    }
  }

Future<SimilarSourceResponse?> getSimilarResponse(String movieId)async {
  final connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    Uri url =Uri.https(ApiConst.baseUrl,ApiConst.similarMovies(movieId),{
      'api_key': ApiConst.apiKey,

    });
    var response=await http.get(url);
    var bodyString=response.body;
    var json=jsonDecode(bodyString);
    return SimilarSourceResponse.fromJson(json);
  }else {
    print('No internet connection');
    return null;
  }


  }




 Future<SearchResponse?> searchMovies(String query )async{
   final connectivityResult = await Connectivity().checkConnectivity();
   if (connectivityResult == ConnectivityResult.mobile ||
       connectivityResult == ConnectivityResult.wifi) {
     Uri url =Uri.https(ApiConst.baseUrl,ApiConst.SearchMovie,{
       'api_key': ApiConst.apiKey,
       'query': query,
     });
     var response=await http.get(url);
     var bodyString=response.body;
     var json=jsonDecode(bodyString);
     return SearchResponse.fromJson(json);
   }else{
     print('No internet connection');
     return null;
   }

  }
}



























