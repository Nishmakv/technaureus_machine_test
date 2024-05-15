import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/features/products/domain/models/models.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? productModel;

  const ProductCard({
    super.key,
    this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: screenWidth * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    blurRadius: 12,
                  )
                ],
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          productModel!.image,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel!.name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$${productModel?.price.toString() ?? "0.00"}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const Text('/kg'),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Icon(
                          Ionicons.add,
                          size: 15,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Ionicons.heart_outline,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
