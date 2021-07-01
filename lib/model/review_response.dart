import 'package:movieapp/model/review.dart';

class ReviewResponse {
  final List<Review> review;
  final String error;

  ReviewResponse(this.review, this.error);

  ReviewResponse.fromJson(Map<String, dynamic> json)
      : review =
  (json["results"] as List).map((i) => new Review.fromJson(i)).toList(),
        error = "";

  ReviewResponse.withError(String errorValue)
      : review = List(),
        error = errorValue;
}