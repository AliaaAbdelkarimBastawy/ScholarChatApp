import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTxtFormFieldWidget extends StatelessWidget {
  String? hintTxt;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool? obscureTest;

   CustomTxtFormFieldWidget({
    super.key,
    required this.hintTxt,
     required this.controller,
     required this.validator,
     this.obscureTest = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureTest!,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
      hintText: hintTxt,
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
      ),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
      ),
    ),

    );
  }
}
