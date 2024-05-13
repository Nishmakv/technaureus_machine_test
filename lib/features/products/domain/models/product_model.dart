import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "created_date")
  final int createdDate;
  @JsonKey(name: "created_time")
  final int createdTime;
  @JsonKey(name: "modified_date")
  final int modifiedDate;
  @JsonKey(name: "modified_time")
  final int modifiedTime;
  @JsonKey(name: "flag")
  final bool flag;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.createdDate,
    required this.createdTime,
    required this.modifiedDate,
    required this.modifiedTime,
    required this.flag,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
