import 'package:farm_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

TextStyle headingStandart = TextStyle(
  fontSize: 16,
  color: white,
);

TextStyle heading2 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle heading5 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle heading6 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle regular16pt = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
TextStyle regular14pt = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle heading16 =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

List<BoxShadow> appBarShadow = [
  BoxShadow(
      color: mainColor, blurRadius: 15, spreadRadius: 2, offset: Offset(0, 2))
];
