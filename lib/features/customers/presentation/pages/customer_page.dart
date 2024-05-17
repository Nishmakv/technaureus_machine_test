import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Duration debounceDuration = Duration(milliseconds: 300);
    Timer? debounceTimer;
    CustomerBloc customer = BlocProvider.of<CustomerBloc>(context);
    customer.add(const GetCustomer());

    final double screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Text(
                    'Customers',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                      child: Container(
                        height: 32,
                        width: 38,
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
                LoadingWidget(
                  isLoading: state.status == CustomerStatus.fetching,
                  child: state.searchCustomers.isNotEmpty
                      ? CustomerList(
                          customerModel: state.searchCustomers,
                        )
                      : SizedBox(
                          height: screenHeight * 0.5,
                          child: const Center(
                            child: Text("No Data Available"),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
