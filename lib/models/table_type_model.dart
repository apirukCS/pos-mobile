import 'dart:convert';

TableTypeModel tableTypeModelFromJson(String str) => TableTypeModel.fromJson(json.decode(str));

String tableTypeModelToJson(TableTypeModel data) => json.encode(data.toJson());

class TableTypeModel {
  final int tableTypeId;
  final String tableTypeName;

  TableTypeModel({
    required this.tableTypeId,
    required this.tableTypeName,
  });

  factory TableTypeModel.fromJson(Map<String, dynamic> json) => TableTypeModel(
    tableTypeId: json["table_type_id"],
    tableTypeName: json["table_type_name"],
  );

  Map<String, dynamic> toJson() => {
    "table_type_id": tableTypeId,
    "table_type_name": tableTypeName,
  };
}
