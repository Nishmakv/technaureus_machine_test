import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/common/common.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

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
    CartBloc product = context.read<CartBloc>();
    product.add(GetCart());
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
                            AddToCartButton(
                                isHomeProduct: isHomeProduct,
                                productModel: productModel)
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

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.isHomeProduct,
    required this.productModel,
  });

  final bool isHomeProduct;
  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int index = -1;
        CartModel? selectedItem;

        if (state.cartItems.isNotEmpty) {
          index =
              state.cartItems.indexWhere((item) => item.id == productModel!.id);
          if (index != -1) {
            selectedItem = state.cartItems[index];
          }
        }

        if (isHomeProduct || index == -1) {
          return GestureDetector(
            onTap: () {
              if (!isHomeProduct) {
                cartBloc.add(
                  AddToCart(
                    cartModel: CartModel(
                      id: productModel!.id,
                      name: productModel!.name,
                      price: productModel!.price,
                      image: productModel!.image,
                      quantity: 1,
                    ),
                  ),
                );
              }
            },
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Ionicons.add,
                size: 15,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          );
        } else {
          return QuantityControlWidget(cartModel: selectedItem!);
        }
      },
    );
  }
}
