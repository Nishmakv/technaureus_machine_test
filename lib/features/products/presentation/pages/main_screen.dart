import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List screens = [
      const HomeScreen(),
      const ProductScreen(),
      const CustomerPage(),
    ];
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.navIndex],
          bottomNavigationBar: SizedBox(
            height: 75,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color(0xffd2e6cd),
                iconSize: 30,
                selectedIconTheme: const IconThemeData(size: 28.0),
                selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
                unselectedItemColor: const Color.fromARGB(255, 8, 100, 28),
                selectedFontSize: 11,
                unselectedFontSize: 11,
                currentIndex: state.navIndex,
                onTap: (index) {
                  context
                      .read<ProductBloc>()
                      .add(NavItemChange(navIndex: index));
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Ionicons.home_outline,
                      size: 22,
                    ),
                    activeIcon: Icon(Ionicons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Ionicons.search_outline,
                      size: 22,
                    ),
                    activeIcon: Icon(Ionicons.search),
                    label: "Product",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Ionicons.person_outline,
                      size: 22,
                    ),
                    activeIcon: Icon(Ionicons.person),
                    label: "Customer",
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: state.navIndex == 1
              ? SizedBox(
                  width: context.width*0.92,
                  height:context.height*0.105,
                  child: const AppFloatingButton(
                    isCustomerSelect: true,
                  ),
                )
              : null,
        );
      },
    );
  }
}
