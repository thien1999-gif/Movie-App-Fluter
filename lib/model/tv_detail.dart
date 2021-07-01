import 'package:movieapp/model/season.dart';

import 'created_by.dart';
import 'genre.dart';
import 'last_episode_to_air.dart';
import 'network.dart';

class TVDetail {
  String backdropPath;
  List<int> episodeRunTime;
  String firstAirDate;
  String homepage;
  int id;
  bool inProduction;
  List<String> languages;
  String lastAirDate;
  String name;
  int numberOfEpisodes;
  int numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  String status;
  String tagline;
  String type;
  double voteAverage;
  int voteCount;
  List<CreatedBy> createdBy;
  List<Genre> genres;
  LastEpisodeToAir lastEpisodeToAir;

  List<Networks> networks;

  List<Seasons> seasons;

  TVDetail(
      this.backdropPath,
      this.episodeRunTime,
      this.firstAirDate,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.name,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount,
      this.createdBy,
      this.genres,
      this.lastEpisodeToAir,
      this.networks,
      this.seasons);

  TVDetail.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'],
        episodeRunTime = json['episode_run_time'].cast<int>(),
        firstAirDate = json['first_air_date'],
        homepage = json['homepage'],
        id = json['id'],
        inProduction = json['in_production'],
        languages = json['languages'].cast<String>(),
        lastAirDate = json['last_air_date'],
        name = json['name'],
        numberOfEpisodes = json['number_of_episodes'],
        numberOfSeasons = json['number_of_seasons'],
        originCountry = json['origin_country'].cast<String>(),
        originalLanguage = json['original_language'],
        originalName = json['original_name'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        status = json['status'],
        tagline = json['tagline'],
        type = json['type'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'],
        lastEpisodeToAir = json['last_episode_to_air'] != null
            ? new LastEpisodeToAir.fromJson(json['last_episode_to_air'])
            : null,
        createdBy = (json['created_by'] as List)
            .map((i) => new CreatedBy.fromJson(i))
            .toList(),
        genres =
            (json['genres'] as List).map((i) => new Genre.fromJson(i)).toList(),
        seasons = (json['seasons'] as List)
            .map((i) => new Seasons.fromJson(i))
            .toList(),
        networks = (json['networks'] as List)
            .map((i) => new Networks.fromJson(i))
            .toList();
}
