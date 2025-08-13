import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/Api/api-const.dart';
import 'package:movies_app/model/Response/MovieDiscoverSurceResponse.dart';
import 'package:movies_app/model/Response/PopularSourceResponse.dart';
import 'package:movies_app/model/Response/SearchResponse.dart';
import 'package:movies_app/model/Response/SimilarSourceResponse.dart';
import 'package:movies_app/model/Response/TopRatedSourceResponse.dart';
import 'package:movies_app/model/Response/UpComingSourceResponse.dart';

import '../model/Request/LogInRequest.dart';
import '../model/Request/RequestRegisterScreen.dart';
import '../model/Response/LoginResponse/LoginResponse.dart';
import '../model/Response/MoveListSourceResponse.dart';
import '../model/Response/RegisterResponse/RegisterResponse.dart';

class ApiManger {
  ApiManger._();

  static ApiManger? _instance;

  static ApiManger getApiInstance() {
    _instance ??= ApiManger._();
    return _instance!;
  }

  Future<PopularSourceResponse?> getPopularResponse({int page = 1}) async {
    /*
  Example:
  https://api.themoviedb.org/3/movie/popular?api_key=...&page=1
  */

    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
        ApiConst.baseUrl,
        ApiConst.popularUrl,
        {
          'api_key': ApiConst.apiKey,
          'page': page.toString(),
        },
      );

      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);

      return PopularSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }


  Future<TopRatedSourceResponse?> getTopRatedResponse({int page = 1}) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiConst.baseUrl, ApiConst.topRateUrl, {'api_key': ApiConst.apiKey,'page': page.toString(),});
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<UpComingSourceResponse?> getUpcomingResponse({int page = 1}) async {
/*

https://api.themoviedb.org/3/movie/upcoming
 */
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiConst.baseUrl, ApiConst.UpComing, {'api_key': ApiConst.apiKey, 'page': page.toString(),});
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return UpComingSourceResponse.fromJson(json);
    } else {
      print('No internet connection');

      return null;
    }
  }

  Future<SimilarSourceResponse?> getSimilarResponse(String movieId,{int page = 1}) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.similarMovies(movieId), {
        'api_key': ApiConst.apiKey,
     'page':page.toString(),
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SimilarSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<SearchResponse?> searchMovies(String query) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.SearchMovie, {
        'api_key': ApiConst.apiKey,
        'query': query,
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SearchResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<MoveListSourceResponse?> getMovieList() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.MovieList, {
        'api_key': ApiConst.apiKey,
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MoveListSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<MovieDiscoverSourceResponse?> getMovieDiscover(String id,{int page = 1}) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.MovieDiscover, {
        'api_key': ApiConst.apiKey,
        'with_genres': id,
    'page':page.toString(),
      });
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieDiscoverSourceResponse.fromJson(json);
    } else {
      print('No internet connection');
      return null;
    }
  }

  Future<RegisterResponse?> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,
      ) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseAuthUrl, ApiConst.registerUrl);

      var requestBody = RequestRegisterScreen(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );

      var response = await http.post(url, body: requestBody.toJson());

      var registerResponse =
      RegisterResponse.fromJson(json.decode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return registerResponse;
      } else {
        return registerResponse;
      }
    } else {
      return RegisterResponse(message: 'Please check internet connection');
    }
  }

  Future<LoginResponse> Login(String email, String password) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConst.baseAuthUrl, ApiConst.loginUrl);

      var requestBody = LogInRequest(
        password: password,
        email: email,
      );

      var response = await http.post(
        url,
        body: requestBody.toJson(),
      );

      var loginResponse = LoginResponse.fromJson(json.decode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return loginResponse;
      } else {
        return loginResponse;
      }
    } else {
      return LoginResponse(message: 'Please check internet connection');
    }
  }















}
