import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';

class CustomerList extends StatelessWidget {
  final List<CustomerModel> customerModel;

  const CustomerList({
    super.key,
    required this.customerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final customer = customerModel[index];
          return CustomerCard(
            customerModel: customer,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CartScreen(
                      customerId: customer.id,
                     
                    );
                  },
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: customerModel.length,
      ),
    );
  }
}
