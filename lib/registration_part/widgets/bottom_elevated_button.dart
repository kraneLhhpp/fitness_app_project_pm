import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomElevatedButton extends StatelessWidget {
  const BottomElevatedButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.submitButton,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final VoidCallback submitButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          submitButton;
        }
      },
      child: Text(
        'Submit',
        style: GoogleFonts.jetBrainsMono(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
