import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/cart_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'My Cart',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const CartList(),
            ],
          ),
        ),
      ),
    );
  }
}
