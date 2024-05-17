import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/features/customers/customers.dart';

class CreateCustomerScreen extends StatelessWidget {
  const CreateCustomerScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController streetTwoController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {
        if (state.status == CustomerStatus.userCreated) {
          context.showSnackBar(message: 'Customer created successfully');
        } else if (state.status == CustomerStatus.exception) {
          context.showSnackBar(message: 'Customer created failed');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                      validator: FormBuilderValidators.required(),
                    ),
                    AppTextField(
                      controller: mobileController,
                      hintText: 'Enter your mobile number',
                      label: 'Mobile',
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
                    ),
                    AppTextField(
                      controller: emailController,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ]),
                    ),
                    AppTextField(
                      controller: streetController,
                      hintText: 'Enter your street',
                      label: 'Street',
                      validator: FormBuilderValidators.required(),
                    ),
                    AppTextField(
                      controller: streetTwoController,
                      hintText: 'Enter your street two',
                      label: 'Street Two',
                      validator: FormBuilderValidators.required(),
                    ),
                    AppTextField(
                      controller: cityController,
                      hintText: 'Enter your city',
                      label: 'City',
                      validator: FormBuilderValidators.required(),
                    ),
                    AppTextField(
                      controller: pincodeController,
                      hintText: 'Enter your pincode',
                      label: 'Pincode',
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(),
                    ),
                    AppTextField(
                      controller: countryController,
                      hintText: 'Enter your country',
                      label: 'Country',
                      validator: FormBuilderValidators.required(),
                    ),
                    AppTextField(
                      controller: stateController,
                      hintText: 'Enter your state',
                      label: 'State',
                      validator: FormBuilderValidators.required(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: AppButton(
                        text: 'Create Customer',
                        onPressed: () {
                          if (!formKey.currentState!.validate()) return;
                          context.read<CustomerBloc>().add(CreateCustomer(
                                  createCustomer: CustomerRequestModel(
                                name: nameController.text,
                                profilePic: null,
                                mobileNumber: mobileController.text,
                                email: emailController.text,
                                street: streetController.text,
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
          ),
        );
      },
    );
  }
}
