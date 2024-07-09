import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';

class TitleAlertConfirmOrder extends StatelessWidget {
  const TitleAlertConfirmOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(),
        Padding(
          padding: const EdgeInsets.only(left: kPadding * 2),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.green,
            ),
            child: const Padding(
              padding: EdgeInsets.all(kHalfPadding * 3),
              child: Icon(
                Icons.question_mark_outlined,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.close,
          ),
        ),
      ],
    );
  }
}
