import 'package:flutter/material.dart';
import 'package:pos_mobile/models/table_size.dart';

enum TABLE_TYPE {
  //สี่เหลี่ยมจัตุรัส/วงกลม (ระยะเก้าอี้เท่าๆกัน)
  SQUARE_FOUR,
  CIRCLE_FOUR,
  CIRCLE_SIX,
  //โต๊ะแนวนอน
  SQUARE_HORIZONTAL_TWO,
  CIRCLE_HORIZONTAL_TWO,
  REGTANGLE_HORIZONTAL_FOUR,
  REGTANGLE_HORIZONTAL_SIX,
  REGTANGLE_HORIZONTAL_EIGHT,
  REGTANGLE_HORIZONTAL_TEN,
  REGTANGLE_HORIZONTAL_TWELVE,
  //โต๊ะแนวตั้ง
  CIRCLE_VERTICAL_TWO,
  SQUARE_VERTICAL_TWO,
  REGTANGLE_VERTICAL_FOUR,
  REGTANGLE_VERTICAL_SIX,
  REGTANGLE_VERTICAL_EIGHT,
  REGTANGLE_VERTICAL_TEN,
  REGTANGLE_VERTICAL_TWELVE,
}

TABLE_TYPE getFromId(int id) {
  switch (id) {
    case 1:
      return TABLE_TYPE.SQUARE_FOUR;
    case 2:
      return TABLE_TYPE.CIRCLE_FOUR;
    case 3:
      return TABLE_TYPE.REGTANGLE_HORIZONTAL_SIX;
    default:
      throw Exception('Invalid enum value');
  }
}

TableSizeModel getSize(BuildContext context, TABLE_TYPE type, double bodyWidth,
    double bodyHeight) {
  switch (type) {
    case TABLE_TYPE.SQUARE_FOUR:
      return TableSizeModel(
        width: bodyHeight * 0.2,
        height: bodyHeight * 0.2,
      );
    case TABLE_TYPE.CIRCLE_FOUR:
      return TableSizeModel(
        width: bodyHeight * 0.2,
        height: bodyHeight * 0.2,
      );
    case TABLE_TYPE.REGTANGLE_HORIZONTAL_SIX:
      return TableSizeModel(
        width: bodyWidth * 0.25,
        height: bodyHeight * 0.25,
      );
    default:
      throw Exception('Invalid enum value');
  }
}

/*String getName(TABLE_TYPE type) {
  switch (type) {
    case TABLE_TYPE.SQUARE_FOUR:
      return 'สี่เหลี่ยมจัตุรัส(4คน)';
    case TABLE_TYPE.CIRCLE_FOUR:
      return 'วงกลม(4คน)';
    case TABLE_TYPE.CIRCLE_SIX:
      return 'วงกลม(6คน)';
    default:
      throw Exception('Invalid enum value');
  }
}*/
