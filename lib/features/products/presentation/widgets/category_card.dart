import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/category_class.dart';

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
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            color: Color.fromARGB(49, 0, 0, 0),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            categoryClass.image,
            width: 50,
            fit: BoxFit.cover,
          ),
          Text(
            categoryClass.name,
          ),
        ],
      ),
    );
  }
}
