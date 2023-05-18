import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/pages/branch/branch_screen.dart';
import 'package:pos_mobile/pages/lobby/components/container_menu.dart';
import 'package:pos_mobile/pages/queue/queue_screen.dart';
import 'package:pos_mobile/utils/size.dart';
import 'package:pos_mobile/widgets/go_back.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    double height = displayHeight(context);
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
              width: width * 0.3,
              height: height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerMenu(
                  text: 'ครัว',
                  onTap: _goToBranch,
                ),
                ContainerMenu(
                  text: 'คิว',
                  onTap: _goToQueuePage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _goToBranch() {
    Get.to(const BranchScreen());
  }

  void _goToQueuePage() {
    Get.to(const QueueScreen());
  }
}
