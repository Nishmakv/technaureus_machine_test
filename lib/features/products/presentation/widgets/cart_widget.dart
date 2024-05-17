import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';
import 'package:technaureus_machine_test/features/products/domain/models/cart_model.dart';

class CartWidget extends StatelessWidget {
  final CartModel cartModel;
  const CartWidget({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        height: context.height * 0.11,
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
        child: Padding(
          padding: const EdgeInsets.all(10),
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
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartModel.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${cartModel.price.toString()}',
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
              ),
              Expanded(child: QuantityControlWidget(cartModel: cartModel)),
              Expanded(
                child: Text(
                  '\$${(cartModel.price * cartModel.quantity).toString()}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
