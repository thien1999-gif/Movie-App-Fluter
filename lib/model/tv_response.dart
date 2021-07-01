import 'package:movieapp/model/tv.dart';

class TVResponse {
  final List<TV> tv;
  final String error;

  TVResponse(this.tv, this.error);

  TVResponse.fromJson(Map<String, dynamic> json)
      : tv = (json["results"] as List).map((i) => new TV.fromJson(i)).toList(),
        error = "";

  TVResponse.withError(String errorValue)
      : tv = List(),
        error = errorValue;
}
