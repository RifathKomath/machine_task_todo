import 'package:flutter/material.dart';
import 'package:to_do_machine_task/core/style/colors.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final bool hasShadow;
  final String? Function(String?)? validator; 

  const AppTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.obscureText = false,
      this.hasShadow = true,
      this.validator,
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteClr,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: lightGreyClr.withOpacity(0.9),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: inputHintClr),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: whiteClr,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
