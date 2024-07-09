import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/widgets/full_button.dart';

class Alert {
  static contentOnly({required BuildContext context, required Widget content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: content,
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }

  static normal({
    required BuildContext context,
    required String text,
    VoidCallback? onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(kHalfPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(kHalfPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FullButton(
                      text: 'ยกเลิก',
                      onPress: () => Get.back(),
                    ),
                  ),
                  const SizedBox(width: kPadding),
                  Expanded(
                    child: FullButton(
                      text: 'ตกลง',
                      onPress: () {
                        onConfirm!();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
