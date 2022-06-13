class LaitModel {
  int id;
  int idVache;
  String? date;
  double quantity;
  double? ph;
  String? matierGrasse;
  double? densite;

  LaitModel({
    required this.id,
    required this.idVache,
    this.date,
    required this.quantity,
    this.ph,
    this.matierGrasse,
    this.densite,
  });

  factory LaitModel.fromJson(Map<String, dynamic> json) => LaitModel(
        id: json["id"],
        idVache: json["id_vache"],
        date: json["date"],
        quantity: json["qte"] is int ? json["qte"].toDouble() : json["qte"],
        ph: json["ph"] is int ? json["ph"].toDouble() : json["ph"],
        matierGrasse: json["matiere_grasse"],
        densite: json["densite"] is int
            ? json["densite"].toDouble()
            : json["densite"],
      );
}
