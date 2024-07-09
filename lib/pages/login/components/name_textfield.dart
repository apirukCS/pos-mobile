import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: boldLarge,
        ),
      ],
    );
  }
}
