import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/sub_menu_category/components/action_alert.dart';
import 'package:pos_mobile/pages/sub_menu_category/components/content_alert.dart';
import 'package:pos_mobile/widgets/card_food_menu.dart';
import 'package:pos_mobile/widgets/dialog/print_receipt.dart';
import 'package:pos_mobile/widgets/go_back.dart';
import 'package:pos_mobile/widgets/normal_button.dart';
import 'package:pos_mobile/widgets/textfield_search.dart';

class SubMenuCategoryScreen extends StatefulWidget {
  const SubMenuCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SubMenuCategoryScreen> createState() => _SubMenuCategoryScreenState();
}

class _SubMenuCategoryScreenState extends State<SubMenuCategoryScreen> {
  bool isSelectOption = false;

  @override
  Widget build(BuildContext context) {
    String image =
        "https://storage.googleapis.com/storage-resrun-pos-com-dev/ys9tfuli33zcn7l81kgfin4plqca";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const GoBack(),
          title: const Text('Zone A โต๊ะ 3'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.receipt_long_outlined),
              onPressed: _onTapReceipt,
            ),
            IconButton(
              icon: const Icon(Icons.qr_code_2_outlined),
              onPressed: _onTapQrCode,
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldSearch(
                    onChanged: _onChanged,
                  ),
                  const SizedBox(height: kPadding),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return NormalButton(
                          text: 'ทั้งหมด',
                          paddingTB: kHalfPadding,
                          paddingLR: kPadding,
                          fontWeight: FontWeight.w600,
                          onPress: _onTapHeaderButton,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: kPadding),
                  const Text(
                    '25 เมนู',
                    style: boldMedium,
                  ),
                  const SizedBox(height: kHalfPadding),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kPadding,
                kPadding * 11,
                kPadding,
                0,
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: kHalfPadding,
                mainAxisSpacing: kHalfPadding,
                childAspectRatio: (1 / .22),
                padding: const EdgeInsets.only(
                  bottom: kPadding,
                ),
                children: List.generate(20, (index) {
                  return CardFoodMenu(
                    nameMenu: 'menu $index',
                    image: image,
                    suffixIcon: Icons.more_vert,
                    onTapCard: _onTapCardFoodMenu,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onChanged(String text) {}

  void _onTapHeaderButton() {}

  void _onTapCardFoodMenu() {
    isSelectOption = false;
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
              ActionAlert(isSelectOption: isSelectOption),
            ],
            contentPadding: EdgeInsets.zero,
          );
        });
      },
    );
  }

  void _onTapReceipt() {
    receiptDialog(context);
  }

  void _onTapQrCode() {}
}
