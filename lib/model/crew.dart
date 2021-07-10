class Crew {
  String department;
  String job;
  String creditId;
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;

  Crew(
      this.department,
        this.job,
        this.creditId,
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath);

  Crew.fromJson(Map<String, dynamic> json)
  :
    department = json['department'],
    job = json['job'],
    creditId = json['credit_id'],
    adult = json['adult'],
    gender = json['gender'],
    id = json['id'],
    knownForDepartment = json['known_for_department'],
    name = json['name'],
    originalName = json['original_name'],
    popularity = json['popularity'],
    profilePath = json['profile_path'];


}