import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PhoneIcon extends StatelessWidget {
  const PhoneIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 25,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff2d4691),
      ),
      child: Icon(
        Ionicons.call,
        color: Theme.of(context).colorScheme.surface,
        size: 11,
      ),
    );
  }
}
