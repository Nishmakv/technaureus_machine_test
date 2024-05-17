import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/products/products.dart';

class CartScreen extends StatelessWidget {
  final int customerId;
  const CartScreen({super.key, required this.customerId});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartBloc>();
    cart.add(GetCart());

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state.status == CartStatus.exception) {
          context.showSnackBar(
            message: state.errorMessage ?? 'An error occurred',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:
                Text('My Cart', style: Theme.of(context).textTheme.titleLarge),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Ionicons.arrow_back,
                  color: Theme.of(context).colorScheme.primary),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MainScreen();
                  },
                ));
              },
            ),
            backgroundColor: const Color.fromARGB(255, 245, 255, 245),
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: state.cartItems.isNotEmpty?
              Column(
                children: [
                  CartList(
                    cartModel: state.cartItems,
                  ),
                ],
              ):SizedBox(
                height: context.height*0.7,
                child: Center(
                  child: Text('No Items in cart',style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ),
          ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.105,
            child: AppFloatingButton(
              id: customerId,
            ),
          ),
        );
      },
    );
  }
}
