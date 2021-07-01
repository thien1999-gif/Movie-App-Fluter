import 'dart:convert';

class TV {
  final int id;
  final double popularity;
  final String backdrop_path;
  final String poster_path;
  final String first_air_date;
  final String overview;
  final double vote_average;
  final String original_language;
  final int vote_count;
  final String name;
  final String original_name;

  TV(
      this.id,
      this.popularity,
      this.backdrop_path,
      this.poster_path,
      this.first_air_date,
      this.overview,
      this.vote_average,
      this.original_language,
      this.vote_count,
      this.name,
      this.original_name);

  TV.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        backdrop_path = json["backdrop_path"],
        poster_path = json["poster_path"],
        first_air_date = json["first_air_date"],
        overview = json["overview"],
        vote_average = json["vote_average"],
        original_language = json["original_language"],
        vote_count = json["vote_count"],
        name = json["name"],
        original_name = json["original_name"];
}
