import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/entity/category.dart';


class CategoryCard extends StatelessWidget {
  final Categories categoryClass;
  const CategoryCard({
    super.key,
    required this.categoryClass,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.2,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryClass.image,
            width: 40,
            fit: BoxFit.cover,
          ),
          Text(
            categoryClass.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
