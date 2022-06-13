import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Comparison extends StatefulWidget {
  const Comparison({Key? key}) : super(key: key);

  @override
  State<Comparison> createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {
  /// Create one series with sample hard coded data.
  final Alimentation _aliment = Alimentation('Alimentation note', 17.6);
  final _average = [Alimentation('Average', 16.8)];

  List<charts.Series<Alimentation, String>> _createSampleData() {
    return [
      charts.Series<Alimentation, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Alimentation alim, _) => alim.alimentation.toString(),
        measureFn: (Alimentation alimentation, _) => alimentation.value,
        data: _average,
      ),
      charts.Series<Alimentation, String>(
        id: 'Sales2',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Alimentation alim, _) => alim.alimentation.toString(),
        measureFn: (Alimentation alimentation, _) => alimentation.value,
        data: [_aliment],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          kSizedBox10,
          Row(
            children: [
              Text('Your Alimentation note : 17.6'),
              SizedBox(width: 10),
              Container(
                height: 30,
                width: 30,
                color: Colors.red,
              )
            ],
          ),
          kSizedBox10,
          Row(
            children: [
              Text('Average note: 16.8'),
              SizedBox(width: 10),
              Container(
                height: 30,
                width: 30,
                color: Colors.blue,
              )
            ],
          ),
          kSizedBox10,
          Text('Goal note ==> from 15 to 19'),
          kSizedBox20,
          Expanded(
            child: charts.BarChart(_createSampleData(),
                primaryMeasureAxis: charts.NumericAxisSpec(
                  tickProviderSpec: charts.StaticNumericTickProviderSpec(
                    <charts.TickSpec<num>>[
                      const charts.TickSpec<num>(0),
                      charts.TickSpec<num>(_aliment.value),
                      charts.TickSpec<num>(_average[0].value),
                      const charts.TickSpec<num>(20),
                    ],
                  ),
                )),
          ),
          kSizedBox10,
        ],
      ),
    );
  }
}

enum AlimentationType { note, average }

/// Sample ordinal data type.
class Alimentation {
  final String alimentation;
  final double value;

  Alimentation(this.alimentation, this.value);
}
