// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()async{
            await FirebaseAuth.instance.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(context, '/first_screen', (_) => false);
          }, 
          icon: Icon(Icons.logout_outlined, color: Colors.blue)
        ),
      ),
      body: SafeArea(
         child: Center(child: Text('AHAHAHAHAHAHAHHA')) 
      ),
    );
  }
}