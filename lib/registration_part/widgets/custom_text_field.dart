import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscure;
  final Widget? countryPrefix;
  final VoidCallback? togglePasswordView;
  final bool? isHiddenPassword;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.onChanged,
    this.obscure = false,
    this.countryPrefix,
    this.togglePasswordView,
    this.isHiddenPassword,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure && (isHiddenPassword ?? false),
      onChanged: onChanged,
      style: GoogleFonts.jetBrainsMono(
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: obscure && togglePasswordView != null
            ? InkWell(
                onTap: togglePasswordView,
                child: Icon(
                  isHiddenPassword! ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
        hintText: hintText,
        filled: true,
        fillColor: Colors.pink[50],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E6EE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.pinkAccent, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.pinkAccent, width: 1.4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.pinkAccent, width: 1.4),
        ),
      ),
    );
  }
}
