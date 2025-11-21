import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset('assets/images/base_profile.png',),
                    ),
                    const SizedBox(height: 20),
                    Text(widget.user.displayName ?? ''),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: ()async{
                        try {
                          await FirebaseAuth.instance.signOut();

                          if (!context.mounted) return;
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/first_screen', 
                            (route) => false, 
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to log out: $e')),
                          );
                        }
                      }, 
                      child: Text('Log Out', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}