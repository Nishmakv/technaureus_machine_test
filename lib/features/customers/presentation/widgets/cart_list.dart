import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1000,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return const CartWidget(
                  image: 'assets/images/pngwing.com-min.png',
                  price: '5',
                  name: 'onion',
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              itemCount: 10,
              ),
        )
      ],
    );
  }
}
