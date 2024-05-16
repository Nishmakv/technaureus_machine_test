import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';
import 'package:technaureus_machine_test/core/enum/quantity_change_type.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/quantity_control_widget.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/features/products/domain/models/cart_model.dart';

class CartWidget extends StatelessWidget {
  final CartModel cartModel;
  const CartWidget({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        height: screenHeight * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.outlineVariant,
              blurRadius: 12,
            )
          ],
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 40,
              child: Image.network(
                baseUrl + cartModel.image,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Column(
                children: [
                  Text(
                    cartModel.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Row(
                    children: [
                      Text(
                        cartModel.price.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '/kg',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            QuantityControlWidget(cartModel: cartModel),
            const SizedBox(width: 15),
            Text(
              (cartModel.price * cartModel.quantity).toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}


