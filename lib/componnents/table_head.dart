import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:flutter/material.dart';

class TableHead extends StatelessWidget {
  TableHead(
      {Key? key, this.color, required this.label, required this.activeSort})
      : super(key: key);

  Color? color;
  String label;
  bool activeSort;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? primaryBlue,
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: regular16pt.copyWith(color: white),
            ),
            Visibility(
              visible: activeSort,
              child: Icon(
                Icons.import_export,
                color: white,
              ),
            )
          ],
        )));
  }
}
