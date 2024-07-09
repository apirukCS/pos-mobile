import 'package:flutter/material.dart';

class ContainerCardQueue extends StatelessWidget {
  const ContainerCardQueue(
      {Key? key, required this.numberOfQueue, required this.amount})
      : super(key: key);

  final String numberOfQueue;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: Color(0xFFfed5c8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'คิวที่ $numberOfQueue',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'จำนวนลูกค้า $amount คน',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
