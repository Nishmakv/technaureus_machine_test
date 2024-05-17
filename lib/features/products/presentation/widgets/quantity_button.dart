import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final void Function()? onTap;
  final Icon icon;
  final Color color;
  
  const QuantityButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 18,
        width: 23,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        child: icon,
      ),
    );
  }
}
