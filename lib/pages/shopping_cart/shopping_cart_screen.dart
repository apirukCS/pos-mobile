import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/nav_bar_menu_category.dart';
import 'package:pos_mobile/pages/shopping_cart/components/btn_select_amount.dart';
import 'package:pos_mobile/pages/shopping_cart/components/card_menu_item.dart';
import 'package:pos_mobile/pages/shopping_cart/components/content_alert.dart';
import 'package:pos_mobile/pages/shopping_cart/components/title_alert_confirm_order.dart';
import 'package:pos_mobile/utils/sizes.dart';
import 'package:pos_mobile/widgets/full_button.dart';
import 'package:pos_mobile/widgets/go_back.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  bool isSelectOption = true;
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    String image =
        "https://storage.googleapis.com/storage-resrun-pos-com-dev/ys9tfuli33zcn7l81kgfin4plqca";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const GoBack(),
          title: const Text('ตะกร้าสินค้า'),
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(kPadding),
              child: Text(
                'ทั้งหมด 15 รายการ',
                style: boldMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kPadding,
                kPadding * 3,
                kPadding,
                0,
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: kHalfPadding,
                mainAxisSpacing: kHalfPadding,
                childAspectRatio: cardOrderedAspRatio(width),
                padding: const EdgeInsets.only(
                  bottom: kBottomNavigationBarHeight + (kPadding * 4),
                ),
                children: List.generate(15, (index) {
                  return CardMenuItem(
                    image: image,
                    nameMenu: 'menu $index',
                    amount: index,
                    price: 10.00 * index,
                    onTapEdit: _onTapEdit,
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(kHalfPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'รวมทั้งหมด',
                            style: boldLarge,
                          ),
                          Text(
                            '100.00',
                            style: boldLargeError,
                          ),
                        ],
                      ),
                      const SizedBox(height: kPadding),
                      FullButton(
                        text: 'ยืนยันออเดอร์',
                        onPress: _onTapConfirmOrder,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapEdit() {
    isSelectOption = false;
    isDelete = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'name menu',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            titlePadding: const EdgeInsets.only(
              left: kPadding,
              right: kPadding,
              top: kHalfPadding,
            ),
            content: ContentAlert(
              selectOption: (selectOption) {
                setState(() {
                  isSelectOption = selectOption;
                });
              },
            ),
            actions: [
              Padding(
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: kPadding),
                    BtnSelectAmount(
                      isDelete: (delete) {
                        setState(() {
                          isDelete = delete;
                        });
                      },
                    ),
                    const SizedBox(height: kPadding),
                    FullButton(
                      text: isDelete ? 'ลบ' : 'บันทึก',
                      paddingTB: 0,
                      btnHeight: 40,
                      color: isSelectOption
                          ? isDelete
                              ? Colors.red.shade600
                              : null
                          : Colors.yellow.shade300,
                      textColor: isSelectOption
                          ? isDelete
                              ? Colors.white
                              : null
                          : Colors.grey.shade300,
                      onPress: isSelectOption
                          ? isDelete
                              ? _onTapDelete
                              : _onTapSave
                          : () {},
                    ),
                  ],
                ),
              ),
            ],
            contentPadding: EdgeInsets.zero,
          );
        });
      },
    );
  }

  void _onTapSave() {
    Get.back();
  }

  void _onTapDelete() {
    Get.back();
  }

  void _onTapConfirmOrder() {
    showDialog(
      context: (context),
      builder: (BuildContext context) {
        return AlertDialog(
          title: const TitleAlertConfirmOrder(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: kPadding),
              const Text('คุณต้องการยืนยันออเดอร์ใช่หรือไม่',
                  style: normalLarge),
              const SizedBox(height: kPadding),
              const Text(
                'หลังจากกดยืนยัน\nอย่าปิดหน้าต่างหรือสลับไปโปรแกรมอื่น!\nข้อมูลอาจสูญหายก่อนครัวได้รับออเดอร์',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: kPadding),
              Row(
                children: [
                  Expanded(
                    child: FullButton(
                      text: 'ยกเลิก',
                      fontSize: 16,
                      color: Colors.grey.shade300,
                      onPress: _onCancel,
                    ),
                  ),
                  const SizedBox(width: kPadding),
                  Expanded(
                    child: FullButton(
                      text: 'ยืนยัน',
                      fontSize: 16,
                      onPress: _onConfirm,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onCancel() {
    Get.back();
  }

  void _onConfirm() {
    Get.back();
    Get.back();
    Get.to(
      const NavBarMenuCategory(index: 2),
    );
  }
}
