import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/cart_icon_widget.dart';

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
         CartIconWidget(),
        ],
      ),
    );
  }
}
