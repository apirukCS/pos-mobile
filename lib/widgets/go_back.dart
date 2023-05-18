import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoBack extends StatelessWidget {
  const GoBack({Key? key, this.onTap}) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? _goBack,
      child: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  void _goBack(){
    Get.back();
  }
}
