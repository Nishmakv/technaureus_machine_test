import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/widgets/product_card.dart';
import 'package:technaureus_machine_test/features/products/domain/models/models.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> items;
  const ProductGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 1),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final product = items[index];
              return ProductCard(
                productModel: product,
              );
            }),
      ),
    );
  }
}
