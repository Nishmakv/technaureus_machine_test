import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductBloc product = context.read<ProductBloc>();
    product.add(const GetProduct());
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state.status == ProductStatus.exception) {
          context.showSnackBar(
            message: state.errorMessage ?? 'Please try again later',
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Products',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const CartIconWidget(),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingWidget(
                      isLoading: state.status == ProductStatus.fetching,
                      height: context.height * 0.7,
                      child: state.products.isEmpty
                          ? Center(
                              child: Text(
                                "No Products",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          : ProductGrid(items: state.products),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
