import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class CardMenuItem extends StatelessWidget {
  const CardMenuItem({
    Key? key,
    required this.image,
    required this.nameMenu,
    required this.price,
    required this.amount,
    required this.onTapEdit,
    this.cardHeight,
  }) : super(key: key);

  final String image;
  final String nameMenu;
  final double price;
  final int amount;
  final VoidCallback onTapEdit;
  final double? cardHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: cardHeight,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(kHalfPadding),
          child: Row(
            children: [
              Image.network(image),
              // CachedNetworkImage(
              //   placeholder: (context, url) => Center(
              //     child: CircularProgressIndicator(
              //       color: Theme.of(context).primaryColor,
              //     ),
              //   ),
              //   imageUrl: image,
              // ),
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
                    Text('option1', style: hintSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        GestureDetector(
                          onTap: onTapEdit,
                          child: Text(
                            'แก้ไข',
                            style: TextStyle(
                              color: Colors.blue.shade400,
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
