class Seasons {
  String airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String posterPath;
  int seasonNumber;

  Seasons(
      {this.airDate,
        this.episodeCount,
        this.id,
        this.name,
        this.overview,
        this.posterPath,
        this.seasonNumber});

  Seasons.fromJson(Map<String, dynamic> json)
      : airDate = json['air_date'],
        episodeCount = json['episode_count'],
        id = json['id'],
        name = json['name'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        seasonNumber = json['season_number'];
}