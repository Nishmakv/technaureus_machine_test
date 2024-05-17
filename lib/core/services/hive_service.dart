import 'dart:io';
import 'package:hive_flutter/adapters.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

class HiveService {
  static const String hiveCartBox = 'cartBox';

  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(CartModelAdapter());
  }

  Future<Box> cartBox() async {
    return await Hive.openBox(hiveCartBox);
  }

  Future addToCart(CartModel cartModel) async {
    final box = await cartBox();
    await box.add(cartModel);
    return getCart();
  }

  Future<List<CartModel>> getCart() async {
    final box = await cartBox();

    final items = box.values.cast<CartModel>().toList().reversed.toList();
    return items;
  }

  Future removeFromCart(int index) async {
    final box = await cartBox();
    await box.deleteAt(index);
  }

  Future<List<CartModel>> quantityChange(
    int id,
    QuantityChangeType type,
  ) async {
    final box = await cartBox();
    final items = box.values.cast<CartModel>().toList();
    final index = items.indexWhere((item) => item.id == id);

    if (index != -1) {
      final cartItem = items[index];
      final newQuantity = (type == QuantityChangeType.increment)
          ? cartItem.quantity + 1
          : cartItem.quantity - 1;

      if (newQuantity > 0) {
        final updatedItem = CartModel(
          id: cartItem.id,
          name: cartItem.name,
          price: cartItem.price,
          image: cartItem.image,
          quantity: newQuantity,
        );
        await box.putAt(index, updatedItem);
      } else {
        await box.deleteAt(index);
      }
    }

    return getCart();
  }

  Future clearCart() async {
    final box = await cartBox();
    box.clear();
  }
}
