import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Lottie.asset(
            'assets/animations/Animation - 1715767693983.json',
            width: 150,
          ))
        : child;
  }
}
