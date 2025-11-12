import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obscure;
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomTextField({super.key, this.onChanged, this.validator, required this.controller, required this.hintText, this.obscure=false });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(isFocused: true),
        errorBorder: _buildBorder(isError: true),
        focusedErrorBorder: _buildBorder(isError: true, isFocused: true)
      ),
    );
  }

   OutlineInputBorder _buildBorder({
    bool isError = false,
    bool isFocused = false,
   }){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: isError ? Colors.red : (isFocused ? Colors.blue : Colors.black)
      )
    );
   }
}