import 'package:flutter/material.dart';
import 'package:pos_mobile/utils/sizes.dart';

class BtnSelectAmountSmall extends StatefulWidget {
  const BtnSelectAmountSmall({Key? key}) : super(key: key);

  @override
  State<BtnSelectAmountSmall> createState() => _BtnSelectAmountSmallState();
}

class _BtnSelectAmountSmallState extends State<BtnSelectAmountSmall> {
  double btnHeight = 20;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        btnUpdateAmount(
            icon: Icons.remove,
            width: width * 0.025,
            height: 25,
            onTap: _onPressMinus),
        Container(
          width: width * 0.04,
          height: 25,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Text(
                '$amount',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        btnUpdateAmount(
            icon: Icons.add,
            width: width * 0.025,
            height: 25,
            onTap: _onPressAdd),
      ],
    );
  }

  void _onPressMinus() {
    setState(() {
      if (amount > 1) {
        amount = amount - 1;
      }
    });
  }

  void _onPressAdd() {
    setState(() {
      amount = amount + 1;
    });
  }

  Widget btnUpdateAmount({
    required IconData icon,
    required double width,
    required double height,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Icon(
              icon,
              size: 12,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
