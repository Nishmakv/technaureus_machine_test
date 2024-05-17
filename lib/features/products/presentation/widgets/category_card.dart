import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/core.dart';



class CategoryCard extends StatelessWidget {
  final Categories categoryClass;
  const CategoryCard({
    super.key,
    required this.categoryClass,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.2,
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
