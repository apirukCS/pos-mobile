import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/salse/sales_screen.dart';
import 'package:pos_mobile/utils/size.dart';

class ContainerPosItem extends StatelessWidget {
  const ContainerPosItem({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    return Padding(
      padding: const EdgeInsets.all(kHalfPadding),
      child: InkWell(
        onTap: _onTap,
        child: Container(
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

  void _onTap() {
    Get.to(const SalesScreen());
  }
}
