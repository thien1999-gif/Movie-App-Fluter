import 'package:flutter/material.dart';
import 'package:movieapp/model/cast_response.dart';
import 'package:movieapp/model/genre_response.dart';
import 'package:movieapp/model/movie_detail_response.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:movieapp/model/person_response.dart';
import 'package:movieapp/model/review_response.dart';
import 'package:movieapp/model/tv_detail_response.dart';
import 'package:movieapp/model/tv_response.dart';
import 'package:movieapp/model/tv_season_response.dart';
import 'package:movieapp/model/video_response.dart';
import 'package:movieapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CastsBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponse> _subject =
      BehaviorSubject<CastResponse>();

  getCasts(int id) async {
    CastResponse response = await _repository.getCasts(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CastResponse> get subject => _subject;
}

class GenresListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<GenreResponse> _subject =
      BehaviorSubject<GenreResponse>();

  getGenres() async {
    GenreResponse response = await _repository.getGenres();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
}

class MovieDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieDetailResponse> _subject =
      BehaviorSubject<MovieDetailResponse>();

  getMovieDetail(int id) async {
    MovieDetailResponse response = await _repository.getMovieDetail(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieDetailResponse> get subject => _subject;
}

class SimilarMoviesBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getSimilarMovies(int id) async {
    MovieResponse response = await _repository.getSimilarMovies(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

class MovieVideosBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject =
      BehaviorSubject<VideoResponse>();

  getMovieVideos(int id) async {
    VideoResponse response = await _repository.getMovieVideos(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}

class MoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

class MoviesListByGenreBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMoviesByGenre(int id) async {
    MovieResponse response = await _repository.getMovieByGenre(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

class NowPlayingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getPlayingMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

class PersonsListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
      BehaviorSubject<PersonResponse>();

  getPersons() async {
    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
}

class MoviePopularBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _behaviorSubject =
      BehaviorSubject<MovieResponse>();

  getMoviePopular() async {
    MovieResponse response = await _repository.getMoviePopular();
    _behaviorSubject.sink.add(response);
  }

  dispose() {
    _behaviorSubject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _behaviorSubject;
}

class PosterBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getPlayingMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

class MovieUpcomingBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _behaviorSubject =
      BehaviorSubject<MovieResponse>();

  getMovieUpcoming() async {
    MovieResponse response = await _repository.getMovieUpcoming();
    _behaviorSubject.sink.add(response);
  }

  dispose() {
    _behaviorSubject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _behaviorSubject;
}

class TVPopularBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVResponse> _behaviorSubject =
      BehaviorSubject<TVResponse>();

  getTVPopular() async {
    TVResponse response = await _repository.getTVPopular();
    _behaviorSubject.sink.add(response);
  }

  dispose() {
    _behaviorSubject.close();
  }

  BehaviorSubject<TVResponse> get subject => _behaviorSubject;
}

class TVTopRatedBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVResponse> _behaviorSubject =
      BehaviorSubject<TVResponse>();

  getTVTopRated() async {
    TVResponse response = await _repository.getTVTopRated();
    _behaviorSubject.sink.add(response);
  }

  dispose() {
    _behaviorSubject.close();
  }

  BehaviorSubject<TVResponse> get subject => _behaviorSubject;
}

class TVOnTheAirBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVResponse> _behaviorSubject =
      BehaviorSubject<TVResponse>();

  getTVOnTheAir() async {
    TVResponse response = await _repository.getTVOnTheAir();
    _behaviorSubject.sink.add(response);
  }

  dispose() {
    _behaviorSubject.close();
  }

  BehaviorSubject<TVResponse> get subject => _behaviorSubject;
}

class TVAiringTodayBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVResponse> _behaviorSubject =
      BehaviorSubject<TVResponse>();

  getTVAiringToday() async {
    TVResponse response = await _repository.getTVAiringToday();
    _behaviorSubject.sink.add(response);
  }

  dispose() {
    _behaviorSubject.close();
  }

  BehaviorSubject<TVResponse> get subject => _behaviorSubject;
}

class TVDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVDetailResponse> _subject =
      BehaviorSubject<TVDetailResponse>();

  getTVDetail(int id) async {
    TVDetailResponse response = await _repository.getTVDetail(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<TVDetailResponse> get subject => _subject;
}

class TVDetailVideosBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject =
      BehaviorSubject<VideoResponse>();

  getTVDetailVideos(int id) async {
    VideoResponse response = await _repository.getTVVideoDetail(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}

class TVReviewBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<ReviewResponse> _subject =
      BehaviorSubject<ReviewResponse>();

  getTVReview(int id) async {
    ReviewResponse response = await _repository.getTVReview(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ReviewResponse> get subject => _subject;
}

class TVRecommentBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVResponse> _subject = BehaviorSubject<TVResponse>();

  getTVRecomment(int id) async {
    TVResponse response = await _repository.getTVRecomment(id);
    _subject.sink.add(response);
  }
  void drainStream() {
    _subject.value = null;
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<TVResponse> get subject => _subject;
}

class TVSimilarBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVResponse> _subject =
  BehaviorSubject<TVResponse>();

  getTVSimilar(int id) async {
    TVResponse response = await _repository.getTVSimilar(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<TVResponse> get subject => _subject;
}

class TVCastBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponse> _subject =
  BehaviorSubject<CastResponse>();

  getCastTV(int id) async {
    CastResponse response = await _repository.getCastTV(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CastResponse> get subject => _subject;
}

class TVSeasonVideosBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject =
  BehaviorSubject<VideoResponse>();

  getTVSeasonVideos(int id, int seasonNumber) async {
    VideoResponse response = await _repository.getTVSeasonVideo(id, seasonNumber);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}

class TVSeasonCastBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponse> _subject =
  BehaviorSubject<CastResponse>();

  getTVSeasonCast(int id, int seasonNumber) async {
    CastResponse response = await _repository.getTVSeasonCast(id, seasonNumber);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CastResponse> get subject => _subject;
}
class TVSeasonDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TVSeasonResponse> _subject =
  BehaviorSubject<TVSeasonResponse>();

  getTVSeasonDetail(int id, int seasonNumber) async {
    TVSeasonResponse response = await _repository.getTVSeasonDetail(id, seasonNumber);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<TVSeasonResponse> get subject => _subject;
}
final tvSeasonDetail = TVSeasonDetailBloc();
final tvSeasonCast = TVSeasonCastBloc();
final tvSeasonVideo = TVSeasonVideosBloc();
final tvCastBloc = TVCastBloc();

final tvSimilarBloc = TVSimilarBloc();
final tvRecommentBloc = TVRecommentBloc();
final tvReviewBloc = TVReviewBloc();
final tvVideoDetaillBloc = TVDetailVideosBloc();
final tvDetailBloc = TVDetailBloc();
final tvPopularBloc = TVPopularBloc();
final tvTopRatedBloc = TVTopRatedBloc();
final tvOnTheAirBloc = TVOnTheAirBloc();
final tvAiringTodayBloc = TVAiringTodayBloc();
final movieUpcomingBloc = MovieUpcomingBloc();
final posterBloc = PosterBloc();
final moviePopularBloc = MoviePopularBloc();
final personsBloc = PersonsListBloc();
final nowPlayingMoviesBloc = NowPlayingListBloc();
final moviesByGenreBloc = MoviesListByGenreBloc();
final moviesBloc = MoviesListBloc();
final movieVideosBloc = MovieVideosBloc();
final similarMoviesBloc = SimilarMoviesBloc();
final movieDetailBloc = MovieDetailBloc();
final genresBloc = GenresListBloc();
final castsBloc = CastsBloc();
