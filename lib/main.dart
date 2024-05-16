import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:technaureus_machine_test/common/app_themes.dart';
import 'package:technaureus_machine_test/core/services/hive_service.dart';
import 'package:technaureus_machine_test/features/customers/application/bloc/customer/customer_bloc.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/product/product_bloc.dart';
import 'package:technaureus_machine_test/features/products/presentation/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService hiveService = HiveService();
  await hiveService.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductBloc(),
      ),
      BlocProvider(
        create: (context) => CustomerBloc(),
      ),
      BlocProvider(
        create: (context) => CartBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
