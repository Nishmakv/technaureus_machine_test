import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/products/products.dart';


class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Good day!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Image.asset(
                'assets/images/hand_waving.png',
                width: 23,
              ),
            ],
          ),
         const CartIconWidget(),
        ],
      ),
    );
  }
}
