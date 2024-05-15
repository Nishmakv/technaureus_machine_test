import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/widgets/app_text_field.dart';
import 'package:technaureus_machine_test/core/widgets/loading_widget.dart';
import 'package:technaureus_machine_test/features/customers/application/bloc/customer/customer_bloc.dart';
import 'package:technaureus_machine_test/features/customers/presentation/pages/create_customer_page.dart';
import 'package:technaureus_machine_test/features/customers/presentation/widgets/customer_list.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Duration debounceDuration = Duration(milliseconds: 300);
    Timer? debounceTimer;
    CustomerBloc customer = BlocProvider.of<CustomerBloc>(context);
    customer.add(const GetCustomer());

    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 70),
                  child: Text(
                    'Customers',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: AppTextField(
                    onChanged: (String value) {
                      debounceTimer?.cancel();
                      debounceTimer = Timer(debounceDuration, () {
                        customer.add(CustomerSearch(searchQuery: value));
                      });
                    },
                    hintText: 'Search',
                    prefixIcon: const Icon(
                      Ionicons.search,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CreateCustomerScreen();
                            },
                          ),
                        );
                      },
                      child: LoadingWidget(
                        isLoading: state.status == CustomerStatus.fetching,
                        child: Container(
                          height: 21,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff2d4691),
                          ),
                          child: Icon(
                            Ionicons.add_sharp,
                            color: Theme.of(context).colorScheme.surface,
                            size: 11,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomerList(
                  customerModel: state.searchCustomers,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
