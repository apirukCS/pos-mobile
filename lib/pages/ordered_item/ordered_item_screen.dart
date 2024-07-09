import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/ordered_item/components/card_order_item.dart';
import 'package:pos_mobile/pages/ordered_item/components/detail_check_price.dart';
import 'package:pos_mobile/utils/sizes.dart';
import 'package:pos_mobile/widgets/go_back.dart';

class OrderedItemScreen extends StatefulWidget {
  const OrderedItemScreen({Key? key}) : super(key: key);

  @override
  State<OrderedItemScreen> createState() => _OrderedItemScreenState();
}

class _OrderedItemScreenState extends State<OrderedItemScreen> {
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    String image =
        "https://storage.googleapis.com/storage-resrun-pos-com-dev/ys9tfuli33zcn7l81kgfin4plqca";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('รายการอาหารที่สั่ง'),
          leading: const GoBack(),
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(kPadding),
              child: Text(
                'ทั้งหมด 10 รายการ',
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
                crossAxisCount: width < 600 ? 1 : 2,
                crossAxisSpacing: kHalfPadding,
                mainAxisSpacing: kHalfPadding,
                childAspectRatio:
                    width < 600 ? (1 / .24) : cardOrderedAspRatio(width),
                padding: const EdgeInsets.only(
                  top: kHalfPadding,
                  bottom: kBottomNavigationBarHeight,
                ),
                children: List.generate(15, (index) {
                  return CardOrderItem(
                    image: image,
                    nameMenu: 'menu $index',
                    option: 'option $index',
                    topping: 'topping $index',
                    amount: index,
                    price: 10.00 * index,
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  _onTapCheckPrice(width);
                },
                child: Container(
                  width: width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: kHalfPadding,
                      bottom: kHalfPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.keyboard_double_arrow_up),
                        SizedBox(width: kHalfPadding),
                        Text(
                          'คำนวณราคา',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapCheckPrice(double width) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      constraints: BoxConstraints(maxWidth: width < 600 ? width : 600),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('คำนวณราคา', style: normalLarge),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: kPadding * 2),
              const DetailCheckPrice(topic: 'ราคารวม', amount: '100.00'),
              const SizedBox(height: kPadding),
              const DetailCheckPrice(topic: 'ส่วนลด', amount: '20.00'),
              const SizedBox(height: kPadding),
              const DetailCheckPrice(
                topic: 'ยอดสุทธิ',
                amount: '80.00',
                isNetBalance: true,
              ),
              const SizedBox(height: kPadding * 2),
              Text(
                'โปรดตรวจสอบยอดสุทธิอีกครั้งกับแคชเชียร์',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: kPadding * 2),
            ],
          ),
        );
      },
    );
  }
}
