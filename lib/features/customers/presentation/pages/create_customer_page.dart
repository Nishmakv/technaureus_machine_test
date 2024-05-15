import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/widgets/app_text_field.dart';

class CreateCustomerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          AppTextField(hintText: 'Enter your name',
          label: 'Name',
         ),
        ],
      ),
      ),
    );
  }
}