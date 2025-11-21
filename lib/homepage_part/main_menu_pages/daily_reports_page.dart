import 'package:fitness_app_project/onboarding_part/widgets/activity_boxes.dart';
import 'package:flutter/material.dart';

class DailyReportsPage extends StatefulWidget {
  const DailyReportsPage({super.key});

  @override
  State<DailyReportsPage> createState() => _DailyReportsPageState();
}

class _DailyReportsPageState extends State<DailyReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Reports', style: TextStyle(color: Color(0xFF808B9A))),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.search)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.menu)
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Track your activity', style: TextStyle(fontSize: 24)),
              Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Recent activity', style: TextStyle(fontSize: 18),),
                            GestureDetector(
                              child: Row(
                                children: const[
                                  Text('Reports', style: TextStyle(color: Color(0xFF1B85F3))), 
                                  Icon(Icons.arrow_forward, color: Color(0xFF1B85F3))
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ActivityBoxes()
                      ],
                    ),
                ),
                ), 
            ],
          ),
        ) 
      ),
    );
  }
}