import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/common/app_themes.dart';
import 'package:technaureus_machine_test/features/products/presentation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const ProductScreen(),
    );
  }
}
