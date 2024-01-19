import 'package:cleaning_app/core/colors/colors.dart';
import 'package:flutter/material.dart';

class CustumformField extends StatelessWidget {
  const CustumformField(
      {super.key,
      required this.hint,
      required this.isObscure,
      required this.controller});

  final String hint;
  final bool isObscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
          fillColor: kgreyform,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15)),
          hintText: hint),
    );
  }
}
