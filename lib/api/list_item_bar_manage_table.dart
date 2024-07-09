import 'package:pos_mobile/models/table_type_model.dart';

class ListItemBarManageTable {
  static Future<List<TableTypeModel>> getAllItemBar() async {
    return [
      TableTypeModel(tableTypeId: 1, tableTypeName: 'สี่เหลี่ยมจัตุรัส(4คน)'),
      TableTypeModel(tableTypeId: 2, tableTypeName: 'วงกลม(4คน)'),
      TableTypeModel(tableTypeId: 3, tableTypeName: 'สี่เหลี่ยมผืนผ้า(6คน)'),
    ];
  }
}
