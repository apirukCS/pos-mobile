import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class FullOutLineButton extends StatelessWidget {
  const FullOutLineButton({
    Key? key,
    required this.text,
    this.icon,
    required this.onPress,
    this.color,
    this.textColor,
    this.paddingTB,
    this.fontSize,
    this.btnHeight,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final Function() onPress;
  final Color? color;
  final Color? textColor;
  final double? paddingTB;
  final double? fontSize;
  final double? btnHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: btnHeight,
      child: OutlinedButton.icon(
        icon: icon != null ? Icon(icon) : Container(),
        label: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.black87,
              fontSize: fontSize ?? 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.only(
            top: paddingTB ?? kPadding,
            bottom: paddingTB ?? kPadding,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
