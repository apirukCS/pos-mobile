import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    Key? key,
    this.onChanged,
    this.hintText,
    this.isReadOnly,
    this.onTap,
    this.contentPaddingTB,
    this.contentPaddingLR,
  }) : super(key: key);

  final Function(String text)? onChanged;
  final VoidCallback? onTap;
  final String? hintText;
  final bool? isReadOnly;
  final double? contentPaddingTB;
  final double? contentPaddingLR;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      readOnly: isReadOnly != null && isReadOnly == true ? isReadOnly! : false,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: contentPaddingTB ?? 8,
          horizontal: contentPaddingLR ?? 0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        hintText: hintText ?? 'ค้นหาอาหาร',
        hintStyle: hintMedium,
        prefixIcon: const Icon(Icons.search_rounded),
      ),
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
