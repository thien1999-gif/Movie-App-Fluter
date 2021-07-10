import 'package:flutter/cupertino.dart';

import 'episode.dart';

class TVSeasons {
  String sId;
  String airDate;
  List<Episodes> episodes;
  String name;
  String overview;
  int id;
  String posterPath;
  int seasonNumber;

  TVSeasons(
      this.sId,
      this.airDate,
      this.episodes,
      this.name,
      this.overview,
      this.id,
      this.posterPath,
      this.seasonNumber);

  TVSeasons.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        airDate = json['air_date'],
        episodes = (json['episodes'] as List)
            .map((e) => new Episodes.fromJson(e))
            .toList(),
        name = json['name'],
        overview = json['overview'],
        id = json['id'],
        posterPath = json['poster_path'],
        seasonNumber = json['season_number'];
}
