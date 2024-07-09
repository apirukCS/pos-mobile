import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

double cardOrderedAspRatio(double width) {
  return width > 965
      ? (1 / .24)
      : width > 900
          ? (1 / .26)
          : width > 830
              ? (1 / .28)
              : width > 775
                  ? (1 / .30)
                  : width > 730
                      ? (1 / .32)
                      : width > 690
                          ? (1 / .34)
                          : width > 650
                              ? (1 / .36)
                              : width > 620
                                  ? (1 / .38)
                                  : (1 / .40);
}
