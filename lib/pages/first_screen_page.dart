import 'package:flutter/material.dart';

class FirstScreenPage extends StatelessWidget {
  const FirstScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Fitness as a lifestyle', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                const Text('The perfect place to track your workouts and improve your fitness!', 
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 14,
                            )
                          ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    
                  ],
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 54),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                    )
                  ),
                  onPressed: (){}, 
                  child: const Text('Join now', style: TextStyle(color: Colors.blue, fontSize: 14)),
                ),

                const SizedBox(height: 17),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?', style: TextStyle(color: Colors.white, fontSize: 14)),
                    TextButton(onPressed: (){}, child: Text('Log in', style: TextStyle(color: Colors.white, fontSize: 14),))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}