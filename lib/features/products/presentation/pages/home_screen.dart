import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/category_widget.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/product_grid.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
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
                        'assets/images/istockphoto-1306714925-612x612.jpg',
                        width: 30,
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Ionicons.cart_outline),
                  ),
                ],
              ),
            ),
            const GroceryTextField(),
            const SizedBox(height: 20),
            SliderWidget(),
            const SizedBox(height: 20),
            CategoryWidget(),
            const SizedBox(height: 20),
            ProductGrid(items: homeProducts),
          ],
        ),
      ),
    );
  }
}
