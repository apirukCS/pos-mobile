import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class CardOrderItem extends StatelessWidget {
  const CardOrderItem({
    Key? key,
    required this.image,
    required this.nameMenu,
    required this.price,
    required this.amount,
    this.option,
    this.topping,
  }) : super(key: key);

  final String image;
  final String nameMenu;
  final double price;
  final int amount;
  final String? option;
  final String? topping;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(kHalfPadding),
          child: Row(
            children: [
              Image.network(image),
              /*CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                imageUrl: image,
              ),*/
              const SizedBox(
                width: kHalfPadding * 3,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nameMenu,
                          style: boldLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              'x$amount',
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(width: kPadding),
                            Text(
                              'ราคา $price',
                              style: TextStyle(color: Colors.red.shade600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text('$price', style: hintSmall),
                    option != null
                        ? Text(option!, style: hintSmall)
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        topping != null
                            ? Text(topping!, style: hintSmall)
                            : const SizedBox(),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            color: Colors.blue,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(
                              kQuarterPadding * 3,
                              kQuarterPadding / 2,
                              kQuarterPadding * 3,
                              kQuarterPadding / 2,
                            ),
                            child: Center(
                              child: Text(
                                'อยู่ในคิว',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
