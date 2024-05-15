import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/customers/domain/domain.dart';

import 'phone_icon.dart';

class CustomerCard extends StatelessWidget {
  final CustomerModel customerModel;
  const CustomerCard({super.key, required this.customerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
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
          Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 100,
                width: 104,
                child: Image.asset(
                  'assets/images/man_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const VerticalDivider(
            color: Color.fromARGB(36, 0, 0, 0),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nesto Hypermarket',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  'ID : 3',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  'West Palazhi, Calicut, Kerala',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: [
                PhoneIcon(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
