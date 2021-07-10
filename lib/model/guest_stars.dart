class GuestStars {
  String creditId;
  int order;
  String character;
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;

  GuestStars(
      this.creditId,
        this.order,
        this.character,
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath);

  GuestStars.fromJson(Map<String, dynamic> json)
  :
    creditId = json['credit_id'],
    order = json['order'],
    character = json['character'],
    adult = json['adult'],
    gender = json['gender'],
    id = json['id'],
    knownForDepartment = json['known_for_department'],
    name = json['name'],
    originalName = json['original_name'],
    popularity = json['popularity'],
    profilePath = json['profile_path'];



}