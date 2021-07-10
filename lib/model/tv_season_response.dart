import 'package:movieapp/model/tv_season.dart';
import 'package:movieapp/screens/main_page.dart';

class TVSeasonResponse {
  TVSeasons tvSeasons;
  String error;

  TVSeasonResponse(this.tvSeasons, this.error);

  TVSeasonResponse.fromJson(Map<String, dynamic> json)
      : tvSeasons = TVSeasons.fromJson(json),
        error = "";

  TVSeasonResponse.withError(String errorValue)
      : tvSeasons = TVSeasons(null, null, null, null, null, null, null, null),
        error = errorValue;
}
