import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/widgets/app_button.dart';
import 'package:technaureus_machine_test/features/products/domain/models/models.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/cart_icon_widget.dart';
import 'package:technaureus_machine_test/features/products/presentation/widgets/product_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;

    List<ProductModel> productModel = [];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const CartIconWidget(),
                ],
              ),
              ProductGrid(items: productModel)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
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
                          fontSize: 15, color: Color.fromARGB(255, 71, 79, 71)),
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
      ),
    );
  }
}
