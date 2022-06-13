import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:flutter/material.dart';

class OneCharacter extends StatelessWidget {
  OneCharacter({
    Key? key,
    required this.character,
    this.backgroundColor = const Color(0xfff0981a),
    this.padding = 10.0,
  }) : super(key: key);

  String character;
  final Color backgroundColor;
  double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          character,
          style: regular16pt.copyWith(color: white),
        ));
  }
}
