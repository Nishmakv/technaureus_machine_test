import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? secondaryLabel;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

   AppTextField({
    super.key,
    this.controller,
    this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.secondaryLabel,
    this.inputFormatters,
    this.keyboardType,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 15),
          TextFormField(
            controller: controller,
            cursorColor: Theme.of(context).colorScheme.secondary,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: prefixIcon,
              ),
              suffixIcon: suffixIcon,
              prefixIconConstraints: BoxConstraints(
                minWidth: prefixIcon != null ? 32 : 0,
                minHeight: prefixIcon != null ? 32 : 0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
