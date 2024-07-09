import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade100,
    primaryColor: Colors.yellow.shade600,
    fontFamily: 'Kanit',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow.shade600,
      iconTheme: const IconThemeData(color: Colors.black87),
      actionsIconTheme: const IconThemeData(color: Colors.black87),
      elevation: 0.0,
      titleTextStyle: titleAppBar,
    ),
  );
}
