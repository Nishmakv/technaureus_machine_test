import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CartWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const CartWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        height: screenHeight * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
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
        child: Row(
          children: [
            SizedBox(
              height: 40,
              child: Image.asset(
                'assets/images/pngwing.com-min.png',
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Column(
                children: [
                  Text(
                    'Onion',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$3',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '/kg',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Container(
              height: 30,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Icon(
                Ionicons.remove,
                size: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              '2',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(width: 15),
            Container(
              height: 30,
              width: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Ionicons.add,
                size: 15,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              '\$6',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
