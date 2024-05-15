import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/features/customers/domain/models/models.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/customer_card.dart';

class CustomerList extends StatelessWidget {
  final List<CustomerModel> customerModel;
  const CustomerList({super.key, required this.customerModel});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.09,
          child: ListView.separated(
              itemBuilder: (context, index) {
                final customer = customerModel[index];
                return CustomerCard(
                  customerModel: customer,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              itemCount: customerModel.length,
              ),
        )
      ],
    );
  }
}
