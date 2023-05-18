import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/queue/components/container_table_available.dart';

class TableAvailable extends StatelessWidget {
  const TableAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: (1 / .3),
      padding: const EdgeInsets.all(kHalfPadding),
      children: List.generate(14, (index) {
        return Padding(
          padding: const EdgeInsets.all(kHalfPadding),
          child: ContainerTableAvailable(
            numberOfSeated: '$index',
            zone: 'A',
            amount: '$index',
          ),
        );
      }),
    );
  }
}
