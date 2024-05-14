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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  color: Color.fromARGB(63, 0, 0, 0),
                )
              ],
            ),
            child: Column(
              children: [
                Image.asset(
                  productModel!.image,
                  width: 70,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(productModel!.name),
                        Row(
                          children: [
                            Text(
                                '\$ ${productModel?.price.toString() ?? "0.00"}'),
                            const Text('/kg'),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                     CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(
                        Ionicons.add,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
