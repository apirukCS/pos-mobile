import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/widgets/dialog/alert.dart';
import 'package:pos_mobile/widgets/full_button.dart';
import 'package:pos_mobile/widgets/printer/receipt.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image/image.dart' as Img;

void receiptDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Receipt(
          isPrintReceipt: false,
        ),
        contentPadding: EdgeInsets.zero,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FullButton(
                  text: 'ปิด',
                  fontSize: 16,
                  paddingTB: kQuarterPadding,
                  onPress: () {
                    Get.back();
                  },
                ),
              ),
              const SizedBox(width: kPadding),
              Expanded(
                child: FullButton(
                  text: 'พิมพ์',
                  fontSize: 16,
                  paddingTB: kQuarterPadding,
                  onPress: () => _onTapPrint(context),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void _onTapPrint(BuildContext context) {
  ScreenshotController scrSotCtrl = ScreenshotController();
  scrSotCtrl.captureFromWidget(const Receipt(isPrintReceipt: true)).then((uInt8list) async {
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    await printer.connect(
      '192.168.1.253',
      port: 9100,
    ).then((value){
      final PosPrintResult res = value;
      debugPrint('uInt8list ${uInt8list}');
      debugPrint('res ${res.value}');

      if (res == PosPrintResult.success) {
        final Img.Image? image = Img.decodeImage(uInt8list);
        printer.image(image!);
        printer.cut();
        printer.disconnect();
      }
    });
  });
  Get.back();
}

void showDebugDialog(BuildContext context,String uInt8list,String res){
  Alert.contentOnly(
    context: context,
    content: Column(
      children: [
        Text('uInt8list : $uInt8list'),
        const SizedBox(height: 16),
        Text('res : $res'),
      ],
    ),
  );
}
