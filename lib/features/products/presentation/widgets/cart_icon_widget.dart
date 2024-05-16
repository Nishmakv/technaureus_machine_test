import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/features/customers/presentation/pages/cart_page.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/cart/cart_bloc.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Ionicons.cart_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Positioned(
              top: 2,
              right: 1,
              child: Container(
                width: 18,
                height: 22,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    state.cartItems.length.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
