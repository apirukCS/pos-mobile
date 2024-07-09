import 'package:flutter/material.dart';
import 'package:pos_mobile/enums/table_type.dart';
import 'package:pos_mobile/models/table_position.dart';

class CardTable extends StatelessWidget {
  CardTable({
    Key? key,
    required this.tablePosition,
    required this.gbkTable,
    required this.screenHeight,
  }) : super(key: key);

  final TablePositionModel tablePosition;
  final GlobalKey gbkTable;
  final double screenHeight;

  late double width = tablePosition.tableSizeModel.width;
  late double height = tablePosition.tableSizeModel.height;
  late int tableTypeId = tablePosition.tableTypeModel.tableTypeId;
  late double chairSize = screenHeight * 0.05;

  @override
  Widget build(BuildContext context) {
    TABLE_TYPE tbType = getFromId(tableTypeId);
    switch (tbType) {
      case TABLE_TYPE.SQUARE_FOUR:
        return tableType('sqr_4.jpg');
      case TABLE_TYPE.CIRCLE_FOUR:
        return tableType('circle_4.png');
      case TABLE_TYPE.REGTANGLE_HORIZONTAL_SIX:
        return tableType('rect_6.png');
      default:
        return const SizedBox();
    }
  }

  Widget tableType(String img) {
    String path = "assets/images/table/$img";
    return SizedBox(
      key: gbkTable,
      width: width,
      height: height,
      child: Image.asset(path),
    );
  }
}
