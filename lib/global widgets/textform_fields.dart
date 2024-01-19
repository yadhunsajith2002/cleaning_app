import 'package:cleaning_app/core/colors/colors.dart';
import 'package:flutter/material.dart';

class CustumformField extends StatelessWidget {
  const CustumformField(
      {super.key,
      this.icon,
      required this.hint,
      required this.isObscure,
      required this.controller,
      required this.validator});

  final String hint;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
          suffixIcon: icon,
          fillColor: kgreyform,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          hintText: hint),
    );
  }
}
