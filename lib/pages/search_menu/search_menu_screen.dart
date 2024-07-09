import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/nav_bar_menu_category.dart';
import 'package:pos_mobile/pages/sub_menu_category/components/btn_select_amount.dart';
import 'package:pos_mobile/pages/sub_menu_category/components/content_alert.dart';
import 'package:pos_mobile/widgets/card_food_menu.dart';
import 'package:pos_mobile/widgets/full_button.dart';
import 'package:pos_mobile/widgets/go_back.dart';
import 'package:pos_mobile/widgets/textfield_search.dart';

class SearchMenuScreen extends StatefulWidget {
  const SearchMenuScreen({Key? key}) : super(key: key);

  @override
  State<SearchMenuScreen> createState() => _SearchMenuScreenState();
}

class _SearchMenuScreenState extends State<SearchMenuScreen> {
  bool isSelectOption = false;

  @override
  Widget build(BuildContext context) {
    String image =
        "https://storage.googleapis.com/storage-resrun-pos-com-dev/ys9tfuli33zcn7l81kgfin4plqca";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ค้นหาอาหาร'),
          leading: const GoBack(),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: TextFieldSearch(
                onChanged: onChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kPadding,
                kPadding * 5,
                kPadding,
                0,
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: kHalfPadding,
                mainAxisSpacing: kHalfPadding,
                childAspectRatio: (1 / .22),
                padding: const EdgeInsets.only(bottom: kPadding),
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: InkWell(
            onTap: _onTapCart,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(kHalfPadding * 3),
                child: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onChanged(String text) {}

  void _onTapCardFoodMenu() {
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
                    const BtnSelectAmount(),
                    const SizedBox(height: kPadding),
                    FullButton(
                      text: 'เพิ่มลงตะกร้า',
                      paddingTB: 0,
                      btnHeight: 40,
                      color: isSelectOption ? null : Colors.yellow.shade300,
                      textColor: isSelectOption ? null : Colors.grey.shade400,
                      onPress: isSelectOption ? _addProductToCart : () {},
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

  void _onTapCart() {
    Get.to(const NavBarMenuCategory(index: 1));
  }

  void _addProductToCart() {}
}
