import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    Key? key,
    required this.text,
    this.icon,
    required this.onPress,
    this.color,
    this.textColor,
    this.paddingTB,
    this.fontSize,
    this.paddingLR,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final VoidCallback onPress;
  final Color? color;
  final Color? textColor;
  final double? paddingTB;
  final double? paddingLR;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null ? Icon(icon) : Container(),
      label: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.black87,
            fontSize: fontSize ?? 18,
            fontWeight: fontWeight,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.only(
          top: paddingTB ?? kHalfPadding,
          bottom: paddingTB ?? kHalfPadding,
          left: paddingLR ?? kHalfPadding,
          right: paddingLR ?? kHalfPadding,
        ),
      ),
      onPressed: onPress,
    );
  }
}
