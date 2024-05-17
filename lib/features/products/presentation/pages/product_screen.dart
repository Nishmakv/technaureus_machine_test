import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductBloc product = context.read<ProductBloc>();
    product.add(const GetProduct());
    CustomerBloc customerBloc = context.read<CustomerBloc>();
    customerBloc.add(const GetCustomer());
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LoadingWidget(
          isLoading: state.status == ProductStatus.fetching,
          child: SingleChildScrollView(
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
                state.products.isEmpty
                    ? const Center(
                        child: Text("No data"),
                      )
                    : ProductGrid(items: state.products),
              ],
            ),
          ),
        );
      },
    );
  }
}
