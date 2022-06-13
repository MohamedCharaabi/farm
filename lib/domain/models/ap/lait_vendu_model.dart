class LaitVenduModel {
  String? date;
  double quantity;
  String idTank;
  double prix;
  String cinVend;
  String cinAche;

  LaitVenduModel({
    this.date,
    required this.quantity,
    required this.idTank,
    required this.prix,
    required this.cinVend,
    required this.cinAche,
  });

  factory LaitVenduModel.fromJson(Map<String, dynamic> json) => LaitVenduModel(
        date: json["date"],
        quantity: json["qte"],
        idTank: json["id_tank"],
        prix: json["prix"],
        cinVend: json["cin_vend"],
        cinAche: json["cin_ache"],
      );
}
