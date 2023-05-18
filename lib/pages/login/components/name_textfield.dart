import 'package:flutter/material.dart';
import 'package:pos_mobile/utils/size.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
