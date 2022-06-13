import 'package:farm_mobile/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartExample extends StatelessWidget {
  const PieChartExample({
    Key? key,
    required this.data,
    this.radius = 35.0,
    this.section_space = 0,
  }) : super(key: key);

  final List<int> data;

  final double radius;
  final double section_space;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
          centerSpaceRadius: radius,
          sectionsSpace: section_space,
          borderData: FlBorderData(
            show: false,
            border: const Border(
              bottom: BorderSide(
                color: Colors.transparent,
                width: 12,
              ),
              left: BorderSide(
                color: Colors.transparent,
                width: 12,
              ),
              right: BorderSide(
                color: Colors.transparent,
                width: 12,
              ),
              top: BorderSide(
                color: Colors.transparent,
                width: 12,
              ),
            ),
          ),
          sections: [
            for (var i = 0; i < data.length; i++)
              PieChartSectionData(
                color: piecolors[i].withOpacity(.8),
                value: data[i].toDouble(),
                radius: radius - 25,
                borderSide: BorderSide(
                  color: piecolors[i],
                  width: 2,
                ),
                showTitle: false,
              ),
          ]),
    );
  }
}
