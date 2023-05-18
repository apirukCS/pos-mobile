import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class FullButton extends StatelessWidget {
  const FullButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.icon,
    this.color,
    this.textColor,
    this.paddingTB,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final Function() onPress;
  final Color? color;
  final Color? textColor;
  final double? paddingTB;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: icon != null ? Icon(icon) : Container(),
        label: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.black87,
              fontSize: fontSize ?? 18,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.only(
            top: paddingTB ?? kHalfPadding * 3,
            bottom: paddingTB ?? kHalfPadding * 3,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
