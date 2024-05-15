import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/common/app_themes.dart';
import 'package:technaureus_machine_test/features/customers/application/bloc/customer/customer_bloc.dart';
import 'package:technaureus_machine_test/features/customers/presentation/pages/create_customer_page.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/product/product_bloc.dart';
import 'package:technaureus_machine_test/features/products/presentation/pages/main_screen.dart';
import 'package:technaureus_machine_test/features/products/presentation/pages/pages.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductBloc(),
      ),
      BlocProvider(
        create: (context) => CustomerBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
