import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/product/product_bloc.dart';
import 'package:technaureus_machine_test/features/products/domain/models/models.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? productModel;
  final bool isHomeProduct;

  const ProductCard({
    super.key,
    this.productModel,
    required this.isHomeProduct,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
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
                            width: 90,
                            child: isHomeProduct
                                ? Image.asset(
                                    productModel!.image,
                                  )
                                : Image.network(
                                    baseUrl + productModel!.image,
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Text('/kg'),
                                  ],
                                )
                              ],
                            ),
                            CircleAvatar(
                              radius: 13,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              child: Icon(
                                Ionicons.add,
                                size: 15,
                                color: Theme.of(context).colorScheme.surface,
                              
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      if (isHomeProduct) {
                        context
                            .read<ProductBloc>()
                            .add(AddOrRemoveFav(productModel!.id));
                      }
                    },
                    child: state.favoriteItems.contains(productModel!.id)
                        ? const Icon(
                            Ionicons.heart,
                            color: Colors.red,
                          )
                        : const Icon(
                            Ionicons.heart_outline,
                            color: Colors.red,
                          ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
