import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/product/product_bloc.dart';

class GroceryTextField extends StatelessWidget {
  const GroceryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
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
        child: TextFormField(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          onChanged: (value) {
            context.read<ProductBloc>().add(SearchCategory(value));
          },
          decoration: InputDecoration(
            hintText: 'search grocery',
            hintStyle: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 15,
            ),
            prefixIcon: Icon(
              Ionicons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
