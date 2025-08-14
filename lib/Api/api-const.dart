class ApiConst{
  static const String apiKey='ddfb3c0d202f7fbb62217e3e7f11553c';
  static const String baseUrl='api.themoviedb.org';
static const String popularUrl='/3/movie/popular';
static const String topRateUrl='/3/movie/top_rated';
static const String UpComing='/3/movie/upcoming';
  static const String imageBaseURL = 'https://image.tmdb.org/t/p/';
  static String similarMovies(String movieId) => '/3/movie/$movieId/similar';
  static const String SearchMovie='/3/search/movie';
  static const String MovieList='/3/genre/movie/list';///8
  static const String MovieDiscover='/3/discover/movie';
  static const String registerUrl='api/v1/auth/signup';
  static const String loginUrl='api/v1/auth/signin';
  static const String baseAuthUrl='ecommerce.routemisr.com';

}