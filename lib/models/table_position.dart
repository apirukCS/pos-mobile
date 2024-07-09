import 'dart:convert';

import 'package:pos_mobile/models/table_size.dart';
import 'package:pos_mobile/models/table_type_model.dart';

List<TablePositionModel> tablePositionFromJson(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<TablePositionModel>((json) => TablePositionModel.fromJson(json)).toList();
}

class TablePositionModel {
  final double dx;
  final double dy;
  final TableTypeModel tableTypeModel;
  final TableSizeModel tableSizeModel;

  TablePositionModel({
    required this.dx,
    required this.dy,
    required this.tableTypeModel,
    required this.tableSizeModel,
  });

  factory TablePositionModel.fromJson(Map<String, dynamic> json) =>
      TablePositionModel(
        dx: json["dx"],
        dy: json["dy"],
        tableTypeModel: TableTypeModel.fromJson(json["table_type_model"]),
        tableSizeModel: TableSizeModel.fromJson(json["table_size_model"]),
      );

  Map<String, dynamic> toJson() => {
        "dx": dx,
        "dy": dy,
        "table_type_model": tableTypeModel,
        "table_size_model": tableSizeModel,
      };
}
