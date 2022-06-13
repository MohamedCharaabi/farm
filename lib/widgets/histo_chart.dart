import 'dart:developer';
import 'dart:math';

import 'package:farm_mobile/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HistoChart extends StatefulWidget {
  const HistoChart({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<double> data;

  @override
  State<HistoChart> createState() => _HistoChartState();
}

class _HistoChartState extends State<HistoChart> {
  final Color leftBarColor = const Color(0xff53fdd7);

  final Color rightBarColor = const Color(0xffff5182);

  final double width = 7;

  // late List<BarChartGroupData> rawBarGroups;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // height: 300,
        child: BarChart(
          BarChartData(
            maxY: widget.data.reduce(max),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(color: Colors.black12),

                top: BorderSide(color: Colors.black12),
                left: BorderSide(color: Colors.black12),
                // right: BorderSide(color: Colors.black12),
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: bottomTitles,
                  reservedSize: 42,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 28,
                  interval: widget.data.reduce(max) / 5,
                  getTitlesWidget: leftTitles,
                ),
              ),
            ),
            barGroups: [
              for (int i = 0; i < widget.data.length; i++)
                makeGroupData(
                  i,
                  widget.data[i],
                ),

              // makeGroupData(1, widget.data[1],),
              // makeGroupData(2, widget.data[2],),
              // makeGroupData(3, widget.data[3],),
              // makeGroupData(4, widget.data[4],),
              // makeGroupData(5, widget.data[5],),
              // makeGroupData(6, widget.data[6] ,),
              // makeGroupData(7, widget.data[7],),
              // makeGroupData(8, widget.data[8],),
              // makeGroupData(9, widget.data[9],),
              // makeGroupData(10, widget.data[10],),
              // makeGroupData(11, widget.data[11],),
            ],
            gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 10,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.black12,
                    strokeWidth: 1,
                  );
                }
                // checkToShowHorizontalLine: (double value) {
                //   return value == 1 || value == 6 || value == 4 || value == 5;
                // },
                ),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return Text('${value.toInt()}', style: style);
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          'Jan',
          style: style,
        );
        break;
      case 1:
        text = const Text(
          'Fev',
          style: style,
        );
        break;
      case 2:
        text = const Text(
          'Mar',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          'Avr',
          style: style,
        );
        break;
      case 4:
        text = const Text(
          'May',
          style: style,
        );
        break;
      case 5:
        text = const Text(
          'Jun',
          style: style,
        );
        break;
      case 6:
        text = const Text(
          'Jul',
          style: style,
        );
        break;
      case 7:
        text = const Text(
          'Out',
          style: style,
        );
        break;
      case 8:
        text = const Text(
          'Seb',
          style: style,
        );
        break;
      case 9:
        text = const Text(
          'Oct',
          style: style,
        );
        break;
      case 10:
        text = const Text(
          'Nov',
          style: style,
        );
        break;
      case 11:
        text = const Text(
          'Dec',
          style: style,
        );
        break;
      default:
        text = const Text(
          'Out',
          style: style,
        );
        break;
    }
    return Padding(padding: const EdgeInsets.only(top: 20), child: text);
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: piecolors[x],
        width: width,
        borderRadius: BorderRadius.zero,
      ),
      // BarChartRodData(
      //   toY: y2,
      //   color: rightBarColor,
      //   width: width,
      //   borderRadius: BorderRadius.zero,
      // ),
      // BarChartRodData(
      //   toY: y3,
      //   color: Colors.purple,
      //   width: width,
      //   borderRadius: BorderRadius.zero,
      // ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
