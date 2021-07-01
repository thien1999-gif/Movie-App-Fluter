import 'author_detail.dart';

class Review {
  String author;
  AuthorDetails authorDetails;
  String content;
  String createdAt;
  String id;
  String updatedAt;
  String url;

  Review(
      {this.author,
      this.authorDetails,
      this.content,
      this.createdAt,
      this.id,
      this.updatedAt,
      this.url});

  Review.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        authorDetails = json['author_details'] != null
            ? new AuthorDetails.fromJson(json['author_details'])
            : null,
        content = json['content'],
        createdAt = json['created_at'],
        id = json['id'],
        updatedAt = json['updated_at'],
        url = json['url'];
}
