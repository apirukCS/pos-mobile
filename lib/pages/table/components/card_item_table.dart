import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/utils/sizes.dart';

class CardItemTable extends StatelessWidget {
  const CardItemTable({
    Key? key,
    required this.numberTable,
    required this.isAvailable,
  }) : super(key: key);

  final String numberTable;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Container(
      width: width * 0.6,
      height: width * 0.6,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kHalfPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(numberTable),
            Text(isAvailable ? 'ว่าง' : 'ไม่ว่าง'),
          ],
        ),
      ),
    );
  }
}
