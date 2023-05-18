import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/branch/components/container_pos_item.dart';
import 'package:pos_mobile/utils/size.dart';
import 'package:pos_mobile/widgets/go_back.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    double height = displayHeight(context) - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const GoBack(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: width * 0.2,
              height: height * 0.2,
            ),
            const SizedBox(height: kHalfPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(value: false, onChanged: (value) {}),
                const SizedBox(width: kHalfPadding),
                const Text('เข้าสู่ระบบทันที'),
              ],
            ),
            const SizedBox(height: kHalfPadding),
            SizedBox(
              width: width * 0.8,
              height: height * 0.5,
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: (1 / .6),
                padding: const EdgeInsets.all(kHalfPadding),
                children: List.generate(10, (index) {
                  return ContainerPosItem(text: 'ทดสอบ $index');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
