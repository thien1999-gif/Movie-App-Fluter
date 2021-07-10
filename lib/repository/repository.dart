import 'package:movieapp/model/cast_response.dart';
import 'package:movieapp/model/genre_response.dart';
import 'package:movieapp/model/movie_detail_response.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/model/person_response.dart';
import 'package:movieapp/model/review_response.dart';
import 'package:movieapp/model/tv_detail_response.dart';
import 'package:movieapp/model/tv_response.dart';
import 'package:movieapp/model/tv_season_response.dart';
import 'package:movieapp/model/video_response.dart';

class MovieRepository {
  final String apiKey = "8a1227b5735a7322c4a43a461953d4ff";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  // get movie url
  var movieUrl = "$mainUrl/movie";
  var getTopRatedUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonsUrl = "$mainUrl/trending/person/week";
  var getPopularUrl = "$mainUrl/movie/popular";
  var getUpcomingUrl = "$mainUrl/movie/upcoming";

  //get tv program url
  var getTVPopularUrl = "$mainUrl/tv/popular";
  var getTVTopRatedUrl = "$mainUrl/tv/top_rated";
  var getTVOnTheAirUrl = "$mainUrl/tv/on_the_air";
  var getTVAiringTodayUrl = "$mainUrl/tv/airing_today";
  var tvlUrl = "$mainUrl/tv";

  //function for tv program

  Future<CastResponse> getTVSeasonCast(int id, int seasonNumber) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/season" + "/$seasonNumber" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at tv season cast: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<VideoResponse> getTVSeasonVideo(int id, int seasonNumber) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/season" + "/$seasonNumber" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at tv season video: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<TVSeasonResponse> getTVSeasonDetail(int id, int seasonNumber) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/season" + "/$seasonNumber",
          queryParameters: params);
      return TVSeasonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at tv season detail: $error stackTrace: $stacktrace");
      return TVSeasonResponse.withError("$error");
    }
  }

  Future<CastResponse> getCastTV(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at cast tv: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVSimilar(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/similar",
          queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at tv similar: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }
  
  Future<TVResponse> getTVRecomment(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/recommendations",
          queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at tv recomment: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<ReviewResponse> getTVReview(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/reviews",
          queryParameters: params);
      return ReviewResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at review: $error stackTrace: $stacktrace");
      return ReviewResponse.withError("$error");
    }
  }

  Future<VideoResponse> getTVVideoDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<TVDetailResponse> getTVDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(tvlUrl + "/$id",
          queryParameters: params);
      return TVDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at tv detail: $error stackTrace: $stacktrace");
       return TVDetailResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVPopular() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getTVPopularUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured at get TV popular: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVTopRated() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getTVTopRatedUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured at get TV top rated: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVOnTheAir() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getTVOnTheAirUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured at get TV on the air: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  Future<TVResponse> getTVAiringToday() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getTVAiringTodayUrl, queryParameters: params);
      return TVResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print(
          "Exception occured at get TV airing today: $error stackTrace: $stacktrace");
      return TVResponse.withError("$error");
    }
  }

  //end function for tv program

  //function for movie
  Future<MovieResponse> getMovieUpcoming() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getUpcomingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at popular: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMoviePopular() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured at popular: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getTopRatedUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }
//end function for movie
}
