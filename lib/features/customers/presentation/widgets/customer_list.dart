import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/customers/domain/models/models.dart';
import 'package:technaureus_machine_test/features/customers/presentation/pages/create_customer_page.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/customer_card.dart';

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
                    return CreateCustomerScreen(
                      customer: customer,
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
