import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/enum/quantity_change_type.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';
import 'package:technaureus_machine_test/features/products/application/bloc/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/features/products/domain/models/cart_model.dart';

class QuantityControlWidget extends StatelessWidget {
  const QuantityControlWidget({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityButton(
          onTap: () {
            context.read<CartBloc>().add(
                  OnQuantityChange(
                    id: cartModel.id,
                    type: QuantityChangeType.decrement,
                  ),
                );
          },
          icon: Ionicons.remove,
        ),
        const SizedBox(width: 15),
        Text(
          cartModel.quantity.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(width: 15),
        QuantityButton(
          onTap: () {
            context.read<CartBloc>().add(
                  OnQuantityChange(
                    id: cartModel.id,
                    type: QuantityChangeType.increment,
                  ),
                );
          },
          icon: Ionicons.add,
        ),
      ],
    );
  }
}

