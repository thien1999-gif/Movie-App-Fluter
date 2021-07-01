import 'package:movieapp/model/tv_detail.dart';

class TVDetailResponse{
  final TVDetail tvDetail;
  final String error ;

  TVDetailResponse(this.tvDetail, this.error);
  TVDetailResponse.fromJson(Map<String, dynamic> json)
      : tvDetail = TVDetail.fromJson(json),
        error = "";

  TVDetailResponse.withError(String errorValue)
      : tvDetail = TVDetail( null, null, null, null, null, null, null, null, null, null,
      null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,null),
        error = errorValue;

}