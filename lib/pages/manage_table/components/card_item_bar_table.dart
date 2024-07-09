import 'package:flutter/material.dart';
import 'package:pos_mobile/config/style.dart';
import 'package:pos_mobile/enums/table_type.dart';

class CardItemBarTable extends StatelessWidget {
  CardItemBarTable({
    super.key,
    required this.tableTypeId,
    required this.barHeight,
    required this.barWidth,
    required this.screenWidth,
    required this.screenHeight,
  });

  final int tableTypeId;
  final double barHeight;
  final double barWidth;
  final double screenWidth;
  final double screenHeight;
  late double chairSize = screenHeight * 0.04;

  @override
  Widget build(BuildContext context) {
    TABLE_TYPE tableType = getFromId(tableTypeId);
    switch (tableType) {
      case TABLE_TYPE.SQUARE_FOUR:
        return squareFour();
      case TABLE_TYPE.CIRCLE_FOUR:
        return circleFour();
      case TABLE_TYPE.REGTANGLE_HORIZONTAL_SIX:
        return rectHztSix();
      default:
        return const SizedBox();
    }
  }

  Widget squareFour() {
    double width = barHeight * 0.15;
    return cardBarHeight(
      height: width,
      widget: SizedBox(
        width: width,
        child: Stack(
          children: [
            positionChair(
              top: 0,
              left: (width / 2) - (chairSize / 2),
            ),
            positionChair(
              bottom: 0,
              left: (width / 2) - (chairSize / 2),
            ),
            positionChair(
              top: (width / 2) - (chairSize / 2),
              left: 0,
            ),
            positionChair(
              top: (width / 2) - (chairSize / 2),
              right: 0,
            ),
            Padding(
              padding: EdgeInsets.all(chairSize / 2),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.black54,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kHalfPadding),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleFour() {
    double width = barHeight * 0.15;
    return cardBarHeight(
      height: width,
      widget: SizedBox(
        width: width,
        child: Stack(
          children: [
            positionChair(
              top: 0,
              left: (width / 2) - (chairSize / 2),
            ),
            positionChair(
              bottom: 0,
              left: (width / 2) - (chairSize / 2),
            ),
            positionChair(
              top: (width / 2) - (chairSize / 2),
              left: 0,
            ),
            positionChair(
              top: (width / 2) - (chairSize / 2),
              right: 0,
            ),
            Padding(
              padding: EdgeInsets.all(chairSize / 2),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Colors.black54,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kHalfPadding),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rectHztSix() {
    chairSize = screenHeight * 0.04;
    return cardBarHeight(
      widget: SizedBox(
        width: barWidth,
        child: Stack(
          children: [
            positionChair(
              top: 0,
              left: (barWidth / 4) - (chairSize / 2),
            ),
            positionChair(
              top: 0,
              left: (barWidth / 4 * 2) - (chairSize / 2),
            ),
            positionChair(
              top: 0,
              left: (barWidth / 4 * 3) - (chairSize / 2),
            ),
            positionChair(
              bottom: 0,
              left: (barWidth / 4) - (chairSize / 2),
            ),
            positionChair(
              bottom: 0,
              left: (barWidth / 4 * 2) - (chairSize / 2),
            ),
            positionChair(
              bottom: 0,
              left: (barWidth / 4 * 3) - (chairSize / 2),
            ),
            Padding(
              padding: EdgeInsets.all(chairSize / 2),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.black54,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kHalfPadding),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardBarHeight({required Widget widget,double? height}) {
    return SizedBox(
      height: height ?? barHeight * 0.18,
      child: Center(child: widget),
    );
  }

  Widget positionChair(
      {double? top, double? left, double? bottom, double? right}) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: chairSize,
        height: chairSize,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          color: Colors.black26,
        ),
      ),
    );
  }
}
