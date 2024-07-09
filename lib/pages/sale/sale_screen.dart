import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/utils/sizes.dart';
import 'package:pos_mobile/widgets/full_button.dart';
import 'package:pos_mobile/widgets/go_back.dart';
import 'package:pos_mobile/widgets/normal_button.dart';
import 'package:pos_mobile/widgets/textfield_search.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  bool _isMenuCategoryScreen = true;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    double height = displayHeight(context);
    double btnConfirmHeight = 70;
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            SizedBox(
              width: width * 0.7,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const GoBack(),
                        const SizedBox(width: kPadding),
                        Expanded(
                          child: TextFieldSearch(
                            onChanged: _onChanged,
                          ),
                        ),
                      ],
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
                    const Text('21 หมวดหมู่', style: boldLarge),
                    const SizedBox(height: kHalfPadding),
                    Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 6,
                        crossAxisSpacing: kHalfPadding,
                        mainAxisSpacing: kHalfPadding,
                        childAspectRatio: (1 / 1),
                        children: List.generate(20, (index) {
                          return Container(
                            color: Colors.grey.shade300,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.3,
              height: height,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(width: kQuarterPadding),
                              const Text('ตะกร้าสินค้า', style: titleAppBar),
                            ],
                          ),
                          const SizedBox(height: kHalfPadding),
                          const Divider(thickness: 1),
                          const SizedBox(height: kPadding),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, builder) {
                                return const SizedBox(height: kPadding);
                              },
                              padding: EdgeInsets.only(
                                bottom: btnConfirmHeight + kPadding,
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.grey.shade200,
                                  ),
                                  width: double.infinity,
                                  height: 80,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: confirmBtn(width),
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

  void _onChanged(String txt) {}

  void _onTapHeaderButton() {}

  Widget confirmBtn(double width) {
    return SizedBox(
      width: (width * 0.3),
      child: ElevatedButton.icon(
        icon: Container(),
        label: const Center(
          child: Text(
            'ยืนยันคำสั่งซื้อ',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.only(
            top: kPadding,
            bottom: kPadding,
          ),
        ),
        onPressed: (){},
      ),
    );
  }
}
