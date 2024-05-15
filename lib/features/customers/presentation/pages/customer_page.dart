import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/widgets/app_text_field.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/dummy_customer.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<CustomerModel> customerModel = [];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Text(
                'Customers',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
             AppTextField(
              hintText: 'Search',
              prefixIcon: const Icon(
                Ionicons.search,
              ),
            ),
            // CustomerList(customerModel: customerModel),
            const DummyCustomer(),
          ],
        ),
      ),
    );
  }
}
