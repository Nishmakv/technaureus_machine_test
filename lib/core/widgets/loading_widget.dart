import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final double? height;
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
     this.height,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
          height: height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Lottie.asset(
                  'assets/animations/Animation - 1715767693983.json',
                  width: 150,
                )),
                
              ],
            ),
        )
        : child;
  }
}
