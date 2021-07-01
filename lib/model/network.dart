class Networks {
  String name;
  int id;
  String logoPath;
  String originCountry;

  Networks({this.name, this.id, this.logoPath, this.originCountry});

  Networks.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        logoPath = json['logo_path'],
        originCountry = json['origin_country'];
}