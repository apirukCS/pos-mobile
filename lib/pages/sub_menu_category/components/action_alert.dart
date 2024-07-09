import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/sub_menu_category/components/btn_select_amount.dart';
import 'package:pos_mobile/utils/provider.dart';
import 'package:pos_mobile/widgets/full_button.dart';

class ActionAlert extends StatelessWidget {
  const ActionAlert({Key? key, required this.isSelectOption}) : super(key: key);

  final bool isSelectOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        kHalfPadding,
        0,
        kHalfPadding,
        kHalfPadding,
      ),
      child: Column(
        children: [
          Container(
            height: 0.1,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 0.12,
                  blurRadius: 2.5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          const SizedBox(height: kPadding),
          const BtnSelectAmount(),
          const SizedBox(height: kPadding),
          FullButton(
            text: 'เพิ่มลงตะกร้า',
            paddingTB: 0,
            btnHeight: 40,
            color: isSelectOption ? null : Colors.yellow.shade300,
            textColor: isSelectOption ? null : Colors.grey.shade400,
            onPress: isSelectOption
                ? () {
                    _addProductToCart(context);
                  }
                : () {},
          ),
        ],
      ),
    );
  }
}

void _addProductToCart(BuildContext context) {
  Get.back();
}
