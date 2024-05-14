import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/category_card.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categories'),
          SizedBox(
            height: screenHeight * 0.09,
            child: ListView.separated(
      
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(categoryClass: category);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
