import 'crew.dart';
import 'guest_stars.dart';

class Episodes {
  String airDate;
  int episodeNumber;
  List<Crew> crew;
  List<GuestStars> guestStars;
  int id;
  String name;
  String overview;
  String productionCode;
  int seasonNumber;
  String stillPath;
  double voteAverage;
  int voteCount;

  Episodes(
      this.airDate,
      this.episodeNumber,
      this.crew,
      this.guestStars,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.seasonNumber,
      this.stillPath,
      this.voteAverage,
      this.voteCount);

  Episodes.fromJson(Map<String, dynamic> json)
      : airDate = json['air_date'],
        episodeNumber = json['episode_number'],
        id = json['id'],
        name = json['name'],
        overview = json['overview'],
        productionCode = json['production_code'],
        seasonNumber = json['season_number'],
        stillPath = json['still_path'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'],
        crew = (json['crew'] as List).map((e) => new Crew.fromJson(e)).toList(),
        guestStars = (json['guest_stars'] as List)
            .map((e) => new GuestStars.fromJson(e))
            .toList();
}
