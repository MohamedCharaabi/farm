class LaitGeterModel {
  String idLait;
  String? date;
  double quantity;

  LaitGeterModel({
    required this.idLait,
    this.date,
    required this.quantity,
  });

  factory LaitGeterModel.fromJson(Map<String, dynamic> json) => LaitGeterModel(
        idLait: json["id_lait"],
        date: json["date"],
        quantity: json["qte"],
      );
}
