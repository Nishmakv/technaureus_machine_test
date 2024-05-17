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
          icon: const Icon(
            Ionicons.remove,
            size: 10,
          ),
          color: Theme.of(context).colorScheme.surface,
          
          
        ),
        const SizedBox(width: 5),
        Text(
          cartModel.quantity.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(width: 5),
        QuantityButton(
          onTap: () {
            context.read<CartBloc>().add(
                  OnQuantityChange(
                    id: cartModel.id,
                    type: QuantityChangeType.increment,
                  ),
                );
          },
          icon: Icon(
            Ionicons.add,
            size: 12,
            color: Theme.of(context).colorScheme.surface,
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
