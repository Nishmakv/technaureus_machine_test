import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          const AppBarHome(),
          const GroceryTextField(),
          const SizedBox(height: 10),
          const SliderWidget(),
          const CategoryWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discovery',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Row(
                  children: [
                    Text(
                      'See all',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Icon(
                      Ionicons.chevron_forward,
                      color: Theme.of(context).colorScheme.primary,
                      size: 13,
                    ),
                  ],
                )
              ],
            ),
          ),
          ProductGrid(items: homeProducts, isHomeProduct: true),
        ],
      ),
    );
  }
}
