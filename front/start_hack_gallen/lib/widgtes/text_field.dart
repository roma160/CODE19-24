import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;
  const ReusableTextField(
      {super.key,
      required this.controller,
      required this.isPassword,
      required this.hintText,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      autocorrect: false,
      keyboardType: textInputType,
      cursorColor: Colors.black12,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.3),
        hintText: hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}
