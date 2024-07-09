import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/utils/sizes.dart';

class ContainerMenu extends StatelessWidget {
  const ContainerMenu({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    double height = displayHeight(context);
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width * 0.2,
          height: height * 0.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            color: Colors.grey.shade200,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 26,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
