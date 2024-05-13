import 'package:json_annotation/json_annotation.dart';

part 'order_request_model.g.dart';

@JsonSerializable()
class OrderRequestModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "total_price")
  final String totalPrice;
  @JsonKey(name: "products")
  final List<ProductData> products;

  OrderRequestModel({
    required this.id,
    required this.totalPrice,
    required this.products,
  });
  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestModelToJson(this);
}

@JsonSerializable()
class ProductData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "quantity")
  final String quantity;
  @JsonKey(name: "price")
  final int price;

  ProductData({
    required this.id,
    required this.quantity,
    required this.price,
  });
  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
