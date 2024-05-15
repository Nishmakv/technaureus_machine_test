import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                '5',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
