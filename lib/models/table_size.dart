
class TableSizeModel {
  final double width;
  final double height;

  TableSizeModel({
    required this.width,
    required this.height,
  });

  factory TableSizeModel.fromJson(Map<String, dynamic> json) => TableSizeModel(
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
  };
}
