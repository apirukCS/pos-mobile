import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/utils/sizes.dart';
import 'package:pos_mobile/widgets/container_textfield.dart';
import 'package:pos_mobile/widgets/full_button.dart';

class QueueCard extends StatelessWidget {
  const QueueCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * 0.4,
          child: ContainerTextField(
            textFormField: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: 'จำนวนลูกค้า',
                hintStyle: hintMedium,
              ),
            ),
          ),
        ),
        const SizedBox(height: kPadding * 2),
        SizedBox(
          width: width * 0.4,
          child: FullButton(
            text: 'กดรับบัตรคิว',
            textColor: Colors.white,
            fontSize: 26,
            color: const Color(0xFF15b252),
            onPress: _onPressReceiveQueue,
          ),
        ),
      ],
    );
  }

  void _onPressReceiveQueue() {}
}
