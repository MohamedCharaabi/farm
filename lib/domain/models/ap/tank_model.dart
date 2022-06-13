class TankModel {
  String cin;
  String? date;
  double quantity;

  TankModel({
    required this.cin,
    this.date,
    required this.quantity,
  });

  factory TankModel.fromJson(Map<String, dynamic> json) => TankModel(
        cin: json["cin"],
        date: json["date"],
        quantity: json["qte"],
      );
}
