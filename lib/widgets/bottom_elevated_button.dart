import 'package:flutter/material.dart';

class BottomElevatedButton extends StatelessWidget {
  const BottomElevatedButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.submitButton
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final VoidCallback submitButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1B85F3),
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ), 
      ),
        onPressed: (){
          if(_formKey.currentState!.validate()){
          submitButton;
        }
        }, 
        child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 24)), 
      ), 
    );
  }
}