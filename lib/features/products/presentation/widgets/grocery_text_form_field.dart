import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GroceryTextField extends StatelessWidget {
  const GroceryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              color: Color.fromARGB(2, 0, 0, 0),
            )
          ]),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'search grocery',
          hintStyle: TextStyle(
            color: Theme.of(context).hintColor,
          ),
          prefixIcon: const Icon(Ionicons.search),
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
