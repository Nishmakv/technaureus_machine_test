import 'package:hive_flutter/adapters.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int price;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final int quantity;
  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });
}
