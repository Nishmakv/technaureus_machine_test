import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

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
          context.showSnackBar(
            message: 'Order successfully completed',
          );
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
                              ? context
                                  .read<ProductBloc>()
                                  .add(const NavItemChange(navIndex: 2))
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
}
