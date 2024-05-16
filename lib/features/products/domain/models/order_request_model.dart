import 'package:json_annotation/json_annotation.dart';
part 'order_request_model.g.dart';

@JsonSerializable()
class OrderRequestModel {
  @JsonKey(name: "customer_id")
  final int customerId;
  @JsonKey(name: "total_price")
  final String totalPrice;
  @JsonKey(name: "products")
  final List<Map<String,dynamic>> products;

  OrderRequestModel({
    required this.customerId,
    required this.totalPrice,
    required this.products,
  });

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRequestModelToJson(this);
}

