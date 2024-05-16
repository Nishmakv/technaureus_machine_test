import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/widgets/widgets.dart';
import 'package:technaureus_machine_test/features/customers/application/bloc/customer/customer_bloc.dart';
import 'package:technaureus_machine_test/features/customers/presentation/pages/cart_page.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/customer_card.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/product/product_bloc.dart';
import 'package:technaureus_machine_test/features/products/presentation/pages/main_screen.dart';

class AppFloatingButton extends StatelessWidget {
  final bool isCustomerSelect;
  final int? id;
  const AppFloatingButton({
    super.key,
    this.id,
    this.isCustomerSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state.status == CartStatus.orderCompleted) {
          context.read<ProductBloc>().add(const NavItemChange(navIndex: 0));
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const MainScreen();
            },
          ));
        } else if (state.status == CartStatus.exception) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage ?? "An error Occured"),
          ));
        }
      },
      builder: (context, state) {
        return state.cartItems.isNotEmpty
            ? FloatingActionButton(
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
                            "\$${state.totalPrice}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      AppButton(
                        text: 'CHECKOUT NOW',
                        onPressed: () {
                          isCustomerSelect
                              ? showCheckOutBottomSheet(context)
                              : context.read<CartBloc>().add(OnOrder(id: id!));
                        },
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.expand();
      },
    );
  }

  void showCheckOutBottomSheet(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (context) {
        return BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.7,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final customer = state.customers[index];
                          return CustomerCard(
                            customerModel: customer,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CartScreen(
                                    customerId: customer.id,
                                  );
                                },
                              ));
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                        itemCount: state.customers.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
