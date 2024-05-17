import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> items;
  final bool isHomeProduct;
  const ProductGrid({
    super.key,
    required this.items,
    this.isHomeProduct = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: isHomeProduct ? 0 : 100,
      ),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
            childAspectRatio: context.width / (context.height / 2.3),
          ),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final product = items[index];
            return ProductCard(
              productModel: product,
              isHomeProduct: isHomeProduct,
            );
          }),
    );
  }
}
