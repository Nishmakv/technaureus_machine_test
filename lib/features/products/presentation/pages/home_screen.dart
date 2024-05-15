import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/app_bar_home.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            currentIndex: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.home,
                  size: 22,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.search,
                  size: 22,
                ),
                label: "Product",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Ionicons.person_outline,
                  size: 22,
                ),
                label: "Customer",
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const AppBarHome(),
          const GroceryTextField(),
          const SizedBox(height: 10),
          const SliderWidget(),
          const CategoryWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discovery',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Row(
                  children: [
                    Text(
                      'See all',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Icon(
                      Ionicons.chevron_forward,
                      color: Theme.of(context).colorScheme.primary,
                      size: 13,
                    ),
                  ],
                )
              ],
            ),
          ),
          ProductGrid(items: homeProducts),
          // const CategoryWidget(),
          // const SizedBox(height: 20),
          // ProductGrid(items: homeProducts),
        ],
      ),
    );
  }
}
