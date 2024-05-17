import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.isHomeProduct,
    required this.productModel,
  });

  final bool isHomeProduct;
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int index = -1;
        CartModel? selectedItem;

        if (state.cartItems.isNotEmpty) {
          index =
              state.cartItems.indexWhere((item) => item.id == productModel!.id);
          if (index != -1) {
            selectedItem = state.cartItems[index];
          }
        }

        if (isHomeProduct || index == -1) {
          return GestureDetector(
            onTap: () {
              if (!isHomeProduct) {
                cartBloc.add(
                  AddToCart(
                    cartModel: CartModel(
                      id: productModel!.id,
                      name: productModel!.name,
                      price: productModel!.price,
                      image: productModel!.image,
                      quantity: 1,
                    ),
                  ),
                );
              }
            },
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Ionicons.add,
                size: 15,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          );
        } else {
          return QuantityControlWidget(
            cartModel: selectedItem!,
            
          );
        }
      },
    );
  }
}
