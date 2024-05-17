import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class QuantityButton extends StatelessWidget {
  final void Function()? onTap;
  final IoniconsData icon;
  const QuantityButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          icon,
          size: 15,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}