import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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
