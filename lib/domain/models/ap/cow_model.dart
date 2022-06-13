class CowModel {
  String name;
  String? dateNaissance;
  int owner_cin;
  double? weight;
  String? dateChaleur;

  CowModel(
      {required this.name,
      this.dateNaissance,
      required this.owner_cin,
      this.weight,
      this.dateChaleur});

  factory CowModel.fromJson(Map<String, dynamic> json) => CowModel(
      name: json["name"],
      dateNaissance: json["date_naissance"],
      owner_cin: json["cin_user"],
      weight: json["poids"],
      dateChaleur: json["date_chaleur"]);
}
