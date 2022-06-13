import 'package:farm_mobile/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final IconData? icon;
  Function onClick;
  bool showLoading;

  CustomPrimaryButton(
      {Key? key,
      required this.buttonColor,
      required this.textValue,
      required this.textColor,
      this.showLoading = false,
      this.icon,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              onClick();
            },
            borderRadius: BorderRadius.circular(14.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? FaIcon(
                          icon,
                          color: textColor,
                        )
                      : SizedBox(),
                  icon != null ? SizedBox(width: 10) : SizedBox(),
                  showLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(textColor),
                        )
                      : Text(
                          textValue,
                          style: heading5.copyWith(color: textColor),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
