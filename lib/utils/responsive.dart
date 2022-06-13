import 'package:flutter/widgets.dart';

class Responsive {
  final BuildContext _context;

  Responsive(this._context);

  double get width => MediaQuery.of(_context).size.width;
  double get height => MediaQuery.of(_context).size.height;

  double getWidth(double percent) => width * percent;
  double getHeight(double percent) => height * percent;

  double get responsiveWidth => width / 375;
  double get responsiveHeight => height / 667;

  double get responsiveFontSize =>
      responsiveWidth < responsiveHeight ? responsiveWidth : responsiveHeight;

  double get responsiveFont => 14 * responsiveFontSize;

  double get responsivePadding =>
      responsiveWidth < responsiveHeight ? responsiveWidth : responsiveHeight;

  double get responsivePaddingH =>
      responsiveWidth < responsiveHeight ? responsiveWidth : responsiveHeight;

  double get responsivePaddingV =>
      responsiveWidth < responsiveHeight ? responsiveWidth : responsiveHeight;
}

const double _kSmallScreen = 600.0;
const double _kMediumScreen = 960.0;
const double _kLargeScreen = 1280.0;

class ResponsiveScreen {
  final BuildContext context;

  ResponsiveScreen(this.context);

  bool get isSmallScreen => MediaQuery.of(context).size.width < _kSmallScreen;
  bool get isMediumScreen => MediaQuery.of(context).size.width < _kMediumScreen;
  bool get isLargeScreen => MediaQuery.of(context).size.width < _kLargeScreen;
}

const SizedBox kSizedBox10 = SizedBox(width: 10, height: 10);
const SizedBox kSizedBox20 = SizedBox(width: 20, height: 20);
const SizedBox kSizedBox30 = SizedBox(width: 30, height: 30);
