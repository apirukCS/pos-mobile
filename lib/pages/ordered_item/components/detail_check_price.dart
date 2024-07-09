import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class DetailCheckPrice extends StatelessWidget {
  const DetailCheckPrice({
    Key? key,
    required this.topic,
    required this.amount,
    this.isNetBalance,
  }) : super(key: key);

  final String topic;
  final String amount;
  final bool? isNetBalance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topic,
          style: normalMedium,
        ),
        const SizedBox(
          width: kHalfPadding,
        ),
        Row(
          children: [
            Text(
              amount,
              style: isNetBalance != null ? boldMediumError : boldMedium,
            ),
            Text(
              ' บาท',
              style: isNetBalance != null ? boldMediumError : boldMedium,
            ),
          ],
        ),
      ],
    );
  }
}
