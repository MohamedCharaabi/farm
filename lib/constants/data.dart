import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/domain/models/cow_model.dart';
import 'package:farm_mobile/domain/models/process.dart';
import 'package:farm_mobile/screens/farmer/cow_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String farmerConst = 'Farmer';
const String transporterConst = 'Transporter';
const String buyerConst = 'Buyer';

class CustomMenuItem {
  String label;
  String image;
  String route;
  Color? color;
  int? arguments;

  CustomMenuItem(
      {required this.label,
      required this.image,
      required this.route,
      this.arguments,
      this.color});
}

List<CustomMenuItem> menuData = [
  CustomMenuItem(
      label: 'Dashboard',
      image: 'assets/images/dashboard.png',
      route: '/farmer_dash'),
  CustomMenuItem(
      label: 'My Farm', image: 'assets/images/barley.png', route: '/myfarm'),
  // CustomMenuItem(
  //     label: 'Transporter',
  //     image: 'assets/images/shipment.png',
  //     route: '/transport_call'),
  // CustomMenuItem(
  //     label: 'My Farm', image: 'assets/images/barley.png', route: '/myfarm'),
];

List<CustomMenuItem> transporter_menuData = [
  CustomMenuItem(
      label: 'Feed',
      image: 'assets/images/job-search.png',
      route: '/transporter_feed'),
  CustomMenuItem(
      label: 'Transports',
      image: 'assets/images/parchment.png',
      route: '/transporter_transports'),
  CustomMenuItem(
      label: 'Shop', image: 'assets/images/stand.png', route: '/shop'),
  CustomMenuItem(
      label: 'Cars',
      image: 'assets/images/shipment.png',
      route: '/transporter_cars'),
];

List<CustomMenuItem> myFarmMenu = [
  CustomMenuItem(
      label: 'Total Animals',
      image: 'assets/images/cows.png',
      route: '/all_animals',
      arguments: null,
      color: pinkColor),
  CustomMenuItem(
      label: 'Milking Cows',
      image: 'assets/images/cow_dry.png',
      route: '/all_animals',
      arguments: 0,
      color: cadetBlue),
  CustomMenuItem(
      label: 'Lait',
      image: 'assets/images/milk.png',
      route: '/lait',
      color: darkLateGrey),
  CustomMenuItem(
      label: 'Alimentation',
      image: 'assets/images/wheat-sack.png',
      route: '/alimentation',
      color: goldenrod),
];

// if st == null return all
// else return st cowstatus type
List<DataRow> animalsData(int? st, String? searchTerm, BuildContext context) {
  CowStatus? statusParam = st == null ? null : CowStatus.values[st];

  return cowsData
      .where((el) => st == null ? true : el.status == statusParam)
      .where((el) => (searchTerm == null || searchTerm == '')
          ? true
          : el.id.toLowerCase().contains(searchTerm.toLowerCase()))
      .map((cow) => DataRow(
            cells: [
              DataCell(GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CowDetailsScreen(selectedCow: cow)));
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cow.status == CowStatus.milky
                            ? primaryBlue
                            : goldenrod),
                    child: Center(
                        child: Text(cow.status == CowStatus.milky ? 'M' : 'NM',
                            style: regular16pt.copyWith(color: white))),
                  ),
                ),
              )),
              DataCell(Center(
                  child: Text(
                cow.id,
                style: regular16pt,
              ))),
              DataCell(Text(cow.name, style: regular16pt)),
              DataCell(Text(cow.age ?? '-', style: regular16pt)),
            ],
          ))
      .toList();
}

final List<Cow> cowsData = [
  const Cow(id: '005', name: 'Bella', status: CowStatus.milky),
  const Cow(id: '004', name: 'Stella', status: CowStatus.milky),
  const Cow(
      id: '001', name: 'Staicy', status: CowStatus.notMilky, age: '5y 1m'),
  const Cow(id: '009', name: 'Nancy', status: CowStatus.milky, age: '5y 2m'),
  const Cow(id: '035', name: 'Thema', status: CowStatus.milky),
  const Cow(id: '006', name: 'Gamma', status: CowStatus.milky, age: '5y 3m'),
  const Cow(id: '428', name: 'Ella', status: CowStatus.notMilky),
  const Cow(id: '451', name: 'Jumia', status: CowStatus.notMilky),
  const Cow(id: '030', name: 'Sousan', status: CowStatus.milky),
  const Cow(id: '475', name: 'Fiona', status: CowStatus.notMilky),
  const Cow(id: '359', name: 'Aimy', status: CowStatus.notMilky),
  const Cow(id: '489', name: 'Cristine', status: CowStatus.notMilky),
  const Cow(id: '123', name: 'Blla', status: CowStatus.milky),
  const Cow(id: '435', name: 'Kawasty', status: CowStatus.notMilky),
  const Cow(id: '721', name: 'Chino', status: CowStatus.milky),
  const Cow(id: '075', name: 'Vafela', status: CowStatus.milky),
  const Cow(id: '072', name: 'Naoumi', status: CowStatus.milky),
];

getAnimalData({CowStatus st = CowStatus.milky}) {
  List<Cow> cows = [];
  for (int i = 0; i < cowsData.length; i++) {
    if (cowsData[i].status == st) {
      cows.add(cowsData[i]);
    }
  }
  return cows;
}

List<AnimalProcess> animalsProcessData(Cow? animal) {
  List<AnimalProcess> data = [
    AnimalProcess(
        animal: cowsData[0],
        process: Process(
          date: DateTime.now()
              .subtract(const Duration(days: 1, hours: 5, minutes: 22)),
          food: 3.5,
          milk: 15.6,
        )),
    AnimalProcess(
        animal: cowsData[0],
        process: Process(
            date: DateTime.now()
                .subtract(const Duration(days: 2, hours: 6, minutes: 26)))),
    AnimalProcess(
      animal: cowsData[1],
      process: Process(
        date: DateTime.now()
            .subtract(const Duration(days: 3, hours: 5, minutes: 15)),
        food: 5,
        milk: 17.0,
      ),
    ),
    AnimalProcess(
        animal: cowsData[1],
        process: Process(
          date: DateTime.now()
              .subtract(const Duration(days: 4, hours: 5, minutes: 12)),
          food: 3,
          milk: 14.6,
        )),
  ];

  if (animal != null) {
    data = data.where((element) => element.animal.id == animal.id).toList();
  }
  return data;
}

// if animal == null ==> process all animals else process only the selected animal
List<DataRow> animalProcessDataTable(
    Cow? animal, DateTime? date, FilterDay filter, BuildContext context) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");

  return animalsProcessData(animal)
      .where((el) => filter == FilterDay.all
          ? true
          : filter == FilterDay.day
              ? el.process.date.day == date!.day
              : el.process.date.month == date!.month)
      .map((cow) => DataRow(
            cells: [
              // animal == null ==> all animals,
              if (animal == null)
                DataCell(InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CowDetailsScreen(selectedCow: cow)));
                  },
                  child: Center(
                      child: Text(
                    '${cow.name}(${cow.id})',
                    style: regular16pt.copyWith(fontWeight: FontWeight.bold),
                  )),
                )),
              DataCell(Center(
                  child: Text(
                dateFormat.format(cow.process.date),
                style: regular16pt,
              ))),
              DataCell(Text('${cow.process.food ?? '-'}', style: regular16pt)),
              DataCell(Text('${cow.process.milk ?? '-'}', style: regular16pt)),
            ],
          ))
      .toList();
}
