import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class CardFoodMenu extends StatelessWidget {
  const CardFoodMenu({
    Key? key,
    required this.image,
    required this.nameMenu,
    this.price,
    this.onTapSuffixIcon,
    required this.onTapCard,
    this.suffixIcon,
  }) : super(key: key);

  final String image;
  final String nameMenu;
  final VoidCallback onTapCard;
  final String? price;
  final VoidCallback? onTapSuffixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(kHalfPadding),
          child: Row(
            children: [
              Image.network(image),
              const SizedBox(
                width: kHalfPadding * 3,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameMenu,
                      style: boldLarge,
                    ),
                    price != null ? Text('ราคา $price') : const SizedBox(),
                  ],
                ),
              ),
              suffixIcon != null
                  ? IconButton(
                      onPressed: onTapSuffixIcon,
                      icon: Icon(suffixIcon),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
