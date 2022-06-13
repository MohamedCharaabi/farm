import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/screens/calculation/comparsion.dart';
import 'package:flutter/material.dart';

class ResultCalculationScreen extends StatefulWidget {
  const ResultCalculationScreen({Key? key}) : super(key: key);

  @override
  State<ResultCalculationScreen> createState() =>
      _ResultCalculationScreenState();
}

class _ResultCalculationScreenState extends State<ResultCalculationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              'Result',
              style: heading5,
            ),
            centerTitle: true,
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(icon: Text('Notalim')),
                Tab(icon: Text('Comparaision')),
                Tab(icon: Text('Water')),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Comparison(),
              Icon(Icons.directions_bike),
            ],
          ),
        ));
  }
}
