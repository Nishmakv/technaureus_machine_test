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
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.secondaryLabel,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                label!,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          TextFormField(
            onChanged: onChanged,
            controller: controller,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            cursorColor: Theme.of(context).colorScheme.onBackground,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: prefixIcon,
              ),
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 50,
                maxWidth: 50,
                maxHeight: 50,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: prefixIcon != null ? 32 : 0,
                minHeight: prefixIcon != null ? 32 : 0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Color(0xff989898),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Color(0xff989898),
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
