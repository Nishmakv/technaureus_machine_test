import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/cart_widget.dart';
import 'package:technaureus_machine_test/features/products/domain/models/cart_model.dart';

class CartList extends StatelessWidget {
  final List<CartModel> cartModel;
  const CartList({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final cart = cartModel[index];
            return CartWidget(
              cartModel: cart,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: cartModel.length,
        )
      ],
    );
  }
}
