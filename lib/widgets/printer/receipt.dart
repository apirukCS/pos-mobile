import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class Receipt extends StatelessWidget {
  const Receipt({Key? key, this.isPrintReceipt}) : super(key: key);

  final bool? isPrintReceipt;

  @override
  Widget build(BuildContext context) {
    double receiptWidth = 285;
    return SizedBox(
      width: receiptWidth,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(
          isPrintReceipt != null && isPrintReceipt == true
              ? 0
              : kQuarterPadding,
        ),
        children: [
          SizedBox(
            width: receiptWidth * 0.2,
            height: receiptWidth * 0.2,
            child: Image.asset(
              "assets/images/flower.png",
            ),
          ),
          const SizedBox(height: 8),
          txtStyle('ร้าน เตี๋ยวโต้งไก่ตุ๋น'),
          txtStyle('สาขา มหาสารคาม'),
          txtStyle(
            'ที่อยู่ 83/77 ตลาดน้อยมมส ต.ขามเรียง อ.กันทรวิชัย จ.มหาสารคาม 44150',
          ),
          const SizedBox(height: kPadding),
          txtStyle(
            'ใบเสร็จรับเงิน/ใบกำกับภาษีอย่างย่อ',
            align: TextAlign.center,
          ),
          const SizedBox(height: kPadding),
          txtStyle('เลขที่ใบเสร็จ'),
          txtStyle('เลขที่บิล B665895544'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txtStyle('โซน Zone A โต๊ะ 7'),
              txtStyle('พนักงาน Tong'),
            ],
          ),
          const SizedBox(height: kPadding),
          txtStyle('รายการที่สั่ง'),
          const SizedBox(height: kHalfPadding),
          // const DottedLine(),
          const SizedBox(height: kHalfPadding),
          itemsOrder(
            amount: 'จำนวน',
            productName: 'รายการ',
            price: 'รวม',
          ),
          const SizedBox(height: kHalfPadding),
          // const DottedLine(),
          const SizedBox(height: kHalfPadding),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return itemsOrder(
                amount: '${index + 1}',
                productName: 'ทดสอบ $index',
                price: '${100.0 + index}',
              );
            },
          ),
          const SizedBox(height: kHalfPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txtStyle('ราคารวม'),
              txtStyle('508.0'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txtStyle(
                'ราคารวมสุทธิ',
                isBold: true,
                size: 16,
              ),
              txtStyle('508.0'),
            ],
          ),
          const SizedBox(height: kPadding),
          /*Center(
            child: QrImage(
              data: "1234567890",
              version: QrVersions.auto,
              size: receiptWidth * 0.3,
            ),
          ),*/
          const SizedBox(height: kHalfPadding),
          txtStyle(
            'ชำระเงินได้ที่ qr code ขอบคุณครับ',
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

Widget txtStyle(String txt, {double? size, bool? isBold, TextAlign? align}) {
  return Text(
    txt,
    textAlign: align,
    style: TextStyle(
      color: Colors.black87,
      fontSize: size ?? 12,
      fontWeight: isBold != null && isBold ? FontWeight.w600 : null,
    ),
  );
}

Widget itemsOrder({
  required String amount,
  required String productName,
  required String price,
}) {
  return Row(
    children: [
      SizedBox(
        width: 35,
        child: txtStyle(amount, align: TextAlign.center),
      ),
      const SizedBox(width: kHalfPadding),
      Expanded(
        child: txtStyle(
          productName,
          align: TextAlign.left,
        ),
      ),
      const SizedBox(width: kHalfPadding),
      txtStyle(price),
    ],
  );
}
