import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';

class CreateCustomerScreen extends StatelessWidget {
  final CustomerModel? customer;
  const CreateCustomerScreen({
    super.key,
    this.customer,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: customer?.name ?? '');
    TextEditingController mobileController = TextEditingController(
      text: customer?.mobileNumber ?? '',
    );
    TextEditingController emailController = TextEditingController(
      text: customer?.email ?? '',
    );
    TextEditingController streetController = TextEditingController(
      text: customer?.street ?? '',
    );
    TextEditingController streetTwoController = TextEditingController(
      text: customer?.streetTwo ?? '',
    );
    TextEditingController cityController =
        TextEditingController(text: customer?.city ?? '');
    TextEditingController pincodeController =
        TextEditingController(text: customer?.pincode.toString() ?? '');
    TextEditingController countryController =
        TextEditingController(text: customer?.country ?? '');
    TextEditingController stateController =
        TextEditingController(text: customer?.state ?? '');

    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {
        if (state.status == CustomerStatus.userCreated) {
            context.showSnackBar(message: 'Customer created successfully');
        } else if (state.status == CustomerStatus.exception) {
           context.showSnackBar(message: 'Customer created failed');
        } else if (state.status == CustomerStatus.userUpdated) {
          context.showSnackBar(message: 'Customer updated successfully');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                     'Create Customer',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  AppTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                    label: 'Name',
                  ),
                  AppTextField(
                    controller: mobileController,
                    hintText: 'Enter your mobile number',
                    label: 'Mobile',
                  ),
                  AppTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    label: 'Email',
                  ),
                  AppTextField(
                    controller: streetController,
                    hintText: 'Enter your street',
                    label: 'Street',
                  ),
                  AppTextField(
                    controller: streetTwoController,
                    hintText: 'Enter your street_two',
                    label: 'Street_two',
                  ),
                  AppTextField(
                    controller: cityController,
                    hintText: 'Enter your city',
                    label: 'City',
                  ),
                  AppTextField(
                    controller: pincodeController,
                    hintText: 'Enter your pincode',
                    label: 'Pincode',
                  ),
                  AppTextField(
                    controller: countryController,
                    hintText: 'Enter your country',
                    label: 'Country',
                  ),
                  AppTextField(
                    controller: stateController,
                    hintText: 'Enter your state',
                    label: 'State',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: AppButton(
                      text:'Create Customer',
                      onPressed: () {
                        context.read<CustomerBloc>().add(CreateCustomer(
                                createCustomer: CustomerRequestModel(
                              name: nameController.text,
                              profilePic: null,
                              mobileNumber: mobileController.text,
                              email: emailController.text,
                              street: streetTwoController.text,
                              streetTwo: streetTwoController.text,
                              city: cityController.text,
                              pincode: int.parse(pincodeController.text),
                              country: countryController.text,
                              state: stateController.text,
                            )));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
