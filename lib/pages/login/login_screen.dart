import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/lobby/lobby_screen.dart';
import 'package:pos_mobile/pages/login/components/name_textfield.dart';
import 'package:pos_mobile/utils/sizes.dart';
import 'package:pos_mobile/utils/validate.dart';
import 'package:pos_mobile/widgets/container_textfield.dart';
import 'package:pos_mobile/widgets/full_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var fUserName = FocusNode();
  var fPassWord = FocusNode();

  var userNameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    double height = displayHeight(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          leading: const SizedBox(),
          toolbarHeight: width > height ? height * 0.1 : null,
          title: const Text('เข้าสู่ระบบร้านอาหาร'),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: _onTapBody,
          child: Center(
            child: SizedBox(
              width: width * 0.4,
              child: ListView(
                children: [
                  const SizedBox(height: kPadding),
                  Image.asset(
                    'assets/images/logo.png',
                    width: width * 0.25,
                    height: height * 0.25,
                  ),
                  const SizedBox(height: kPadding),
                  const NameTextField(text: 'ผู้ใช้งาน'),
                  ContainerTextField(
                    textFormField: TextFormField(
                      controller: userNameCtrl,
                      focusNode: fUserName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: 'ผู้ใช้งาน',
                        hintStyle: hintMedium,
                      ),
                      validator: validateString,
                    ),
                  ),
                  userName != null && userName!.isEmpty
                      ? pleaseEnter.call()
                      : const SizedBox(),
                  const SizedBox(height: kPadding),
                  const NameTextField(text: 'รหัสผ่าน'),
                  ContainerTextField(
                    textFormField: TextFormField(
                      controller: passwordCtrl,
                      focusNode: fPassWord,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: 'รหัสผ่าน',
                        hintStyle: hintMedium,
                      ),
                    ),
                  ),
                  password != null && password!.isEmpty
                      ? pleaseEnter.call()
                      : const SizedBox(),
                  const SizedBox(height: kPadding * 2),
                  Center(
                    child: SizedBox(
                      width: width * 0.4,
                      child: FullButton(
                        text: 'เข้าสู่ระบบ',
                        onPress: _onPressLogin,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pleaseEnter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 8),
        Text(
          'กรุณากรอกข้อมูล',
          style: normalMediumError,
        ),
        SizedBox(height: 8),
      ],
    );
  }

  void _onPressLogin() {
    if (userNameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      Get.to(const LobbyScreen());
    } else {
      setState(() {
        userName = userNameCtrl.text;
        password = passwordCtrl.text;
      });
    }
  }

  void _onTapBody(){
    fUserName.unfocus();
    fPassWord.unfocus();
  }
}
