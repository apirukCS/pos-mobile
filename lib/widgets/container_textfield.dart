import 'package:flutter/material.dart';

class ContainerTextField extends StatelessWidget {
  const ContainerTextField({Key? key, required this.textFormField})
      : super(key: key);

  final TextFormField textFormField;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 2,
        ),
      ),
      child: textFormField,
    );
  }
}
