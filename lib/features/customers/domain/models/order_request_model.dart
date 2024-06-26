import 'package:json_annotation/json_annotation.dart';

part 'order_request_model.g.dart';

@JsonSerializable()
class OrderRequestModel {
  @JsonKey(name: "customer_id")
  final int customerId;
  @JsonKey(name: "total_price")
  final int totalPrice;
  @JsonKey(name: "products")
  final List<ProductData> products;

  OrderRequestModel({
    required this.customerId,
    required this.totalPrice,
    required this.products,
  });
  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestModelToJson(this);
}

@JsonSerializable()
class ProductData {
  @JsonKey(name: "product_id")
  final int productId;
  @JsonKey(name: "quantity")
  final int quantity;
  @JsonKey(name: "price")
  final int price;

  ProductData({
    required this.productId,
    required this.quantity,
    required this.price,
  });
  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
