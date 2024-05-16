import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/widgets/app_floating_button.dart';
import 'package:technaureus_machine_test/core/widgets/loading_widget.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/cart_list.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/cart/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  final int customerId;
  const CartScreen({super.key, required this.customerId});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartBloc>();
    cart.add(GetCart());

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LoadingWidget(
          isLoading: state.status == CartStatus.fetching,
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'My Cart',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    CartList(
                      cartModel: state.cartItems,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: SizedBox(
              width: MediaQuery.of(context).size.width * 0.92,
              height: MediaQuery.of(context).size.height * 0.105,
              child:  AppFloatingButton(
                id: customerId,
              ),
            ),
          ),
        );
      },
    );
  }
}
