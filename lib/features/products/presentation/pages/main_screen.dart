import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/widgets/widgets.dart';
import 'package:technaureus_machine_test/features/customers/presentation/pages/customer_page.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/product/product_bloc.dart';
import 'package:technaureus_machine_test/features/products/presentation/pages/pages.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductBloc product = BlocProvider.of<ProductBloc>(context);
    product.add(
      const LoadCategories(),
    );
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
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.105,
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xffd2e6cd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        right: 20,
                        top: 16,
                        bottom: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 71, 79, 71)),
                              ),
                              Text(
                                "\$${42}",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const AppButton(
                            text: 'CHECKOUT NOW',
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
