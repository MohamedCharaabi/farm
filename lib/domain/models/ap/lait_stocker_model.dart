class LaitStockerModel {
  String idLait;
  String? date;
  double quantity;
  String idTank;

  LaitStockerModel({
    required this.idLait,
    this.date,
    required this.quantity,
    required this.idTank,
  });

  factory LaitStockerModel.fromJson(Map<String, dynamic> json) =>
      LaitStockerModel(
        idLait: json["id_lait"],
        date: json["date"],
        quantity: json["qte"],
        idTank: json["id_tank"],
      );
}
