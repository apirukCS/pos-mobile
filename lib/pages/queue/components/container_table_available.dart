import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class ContainerTableAvailable extends StatelessWidget {
  const ContainerTableAvailable(
      {Key? key,
      required this.numberOfSeated,
      required this.zone,
      required this.amount})
      : super(key: key);

  final String numberOfSeated;
  final String zone;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: Color(0xFFd9d9d9),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kQuarterPadding),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '$numberOfSeated Zone $zone',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '$amount ที่นั่ง',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
