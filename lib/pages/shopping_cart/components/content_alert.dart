import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/pages/sub_menu_category/components/btn_select_amount_small.dart';
import 'package:pos_mobile/utils/sizes.dart';

class ContentAlert extends StatefulWidget {
  const ContentAlert({Key? key, this.selectOption}) : super(key: key);

  final Function(bool isSelectOption)? selectOption;

  @override
  State<ContentAlert> createState() => _ContentAlertState();
}

class _ContentAlertState extends State<ContentAlert> {
  bool _isSelectTopping = false;
  bool _isSelectOption = false;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    double height = displayHeight(context);
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(kPadding * 2),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Option',
                        style: normalLarge,
                      ),
                      const Divider(thickness: 0.5),
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                          left: kPadding,
                          right: kPadding,
                        ),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  activeColor: Colors.green,
                                  value: _isSelectOption,
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                      width: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _isSelectOption = !_isSelectOption;
                                      widget.selectOption!(_isSelectOption);
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'option $index',
                                style: normalMedium,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: kPadding * 2),
                      const Text(
                        'รายละเอียดอื่นๆ',
                        style: normalLarge,
                      ),
                      const Divider(thickness: 0.5),
                      const SizedBox(height: kPadding),
                      Padding(
                        padding: const EdgeInsets.only(left: kPadding),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "กรอกรายละเอียดเพิ่มเติม",
                            hintStyle: hintMedium,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: kHalfPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Topping',
                        style: normalLarge,
                      ),
                      const Divider(thickness: 0.5),
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                          left: kPadding,
                          right: kPadding,
                        ),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.5,
                                      child: Checkbox(
                                        activeColor: Colors.green,
                                        value: _isSelectTopping,
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(
                                            width: 1,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _isSelectTopping =
                                                !_isSelectTopping;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      'topping $index',
                                      style: normalMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _isSelectTopping
                                        ? const BtnSelectAmountSmall()
                                        : const SizedBox(),
                                    const SizedBox(width: kPadding),
                                  ],
                                ),
                              ),
                              Text(
                                '$index.00',
                                style: normalMediumError,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: kPadding),
          ],
        ),
      ),
    );
  }
}
