import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/product/product_bloc.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/category_card.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: screenHeight * 0.10,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.searchCategories.length,
                  itemBuilder: (context, index) {
                    final category = state.searchCategories[index];
                    return CategoryCard(categoryClass: category);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
