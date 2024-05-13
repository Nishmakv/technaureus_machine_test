// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequestModel _$OrderRequestModelFromJson(Map<String, dynamic> json) =>
    OrderRequestModel(
      id: (json['id'] as num).toInt(),
      totalPrice: json['total_price'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderRequestModelToJson(OrderRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_price': instance.totalPrice,
      'products': instance.products,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: (json['id'] as num).toInt(),
      quantity: json['quantity'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
    };
