import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/manage_table/manage_table_screen.dart';
import 'package:pos_mobile/pages/nav_bar_sub_category.dart';
import 'package:pos_mobile/pages/search_menu/search_menu_screen.dart';
import 'package:pos_mobile/widgets/card_food_menu.dart';
import 'package:pos_mobile/widgets/dialog/print_receipt.dart';
import 'package:pos_mobile/widgets/go_back.dart';
import 'package:pos_mobile/widgets/textfield_search.dart';

class MenuCategoryScreen extends StatefulWidget {
  const MenuCategoryScreen({Key? key}) : super(key: key);

  @override
  State<MenuCategoryScreen> createState() => _MenuCategoryScreenState();
}

class _MenuCategoryScreenState extends State<MenuCategoryScreen> {
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
            IconButton(
              onPressed: _onTapManageTable,
              icon: const Icon(Icons.table_chart),
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kQuarterPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldSearch(
                    isReadOnly: true,
                    onTap: _onTapTextFieldSearch,
                  ),
                  const SizedBox(height: kPadding),
                  const Text(
                    'หมวดหมู่อาหาร',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: kPadding),
                  const Text(
                    '25 หมวดหมู่',
                    style: boldMedium,
                  ),
                  const SizedBox(height: kHalfPadding),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kPadding,
                kPadding * 10,
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
                  return GestureDetector(
                    child: CardFoodMenu(
                      nameMenu: 'menu $index',
                      image: image,
                      onTapCard: _onTapCardFoodMenu,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapTextFieldSearch() {
    Get.to(const SearchMenuScreen());
  }

  void _onTapCardFoodMenu() {
    Get.to(const NavBarSubCategory());
  }

  void _onTapReceipt() {
    receiptDialog(context);
  }

  void _onTapQrCode() {}

  void _onTapManageTable() {
    Get.to(const ManageTableScreen());
  }
}
