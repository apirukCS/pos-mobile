import 'package:flutter/material.dart';
import 'package:pos_mobile/utils/sizes.dart';

class BtnSelectAmount extends StatefulWidget {
  const BtnSelectAmount({Key? key}) : super(key: key);

  @override
  State<BtnSelectAmount> createState() => _BtnSelectAmountState();
}

class _BtnSelectAmountState extends State<BtnSelectAmount> {
  double btnHeight = 40;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * 0.04,
          height: btnHeight,
          child: OutlinedButton(
            onPressed: _onPressMinus,
            child: const Text(
              '-',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.2,
          height: btnHeight,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              '$amount',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.04,
          height: btnHeight,
          child: OutlinedButton(
            onPressed: _onPressAdd,
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ),
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
}
