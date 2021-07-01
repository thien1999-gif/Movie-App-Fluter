class CreatedBy {
  int id;
  String creditId;
  String name;
  int gender;
  String profilePath;

  CreatedBy({this.id, this.creditId, this.name, this.gender, this.profilePath});

  CreatedBy.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        creditId = json['credit_id'],
        name = json['name'],
        gender = json['gender'],
        profilePath = json['profile_path'];
}
