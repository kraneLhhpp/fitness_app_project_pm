import 'package:fitness_app_project/services/completed_service.dart';
import 'package:flutter/material.dart';

class DailyReportsPage extends StatefulWidget {
  const DailyReportsPage({super.key});

  @override
  State<DailyReportsPage> createState() => _DailyReportsPageState();
}

class _DailyReportsPageState extends State<DailyReportsPage> {

  final completedService = CompletedService(); // правильное создание singleton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Reports',
          style: TextStyle(color: Color(0xFF808B9A)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search)
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu)
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Track your activity',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Recent Activity header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent activity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          'Reports',
                          style: TextStyle(color: Color(0xFF1B85F3)),
                        ),
                        Icon(Icons.arrow_forward, color: Color(0xFF1B85F3))
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // MAIN LIST (scrolls correctly)
              Expanded(
                child: completedService.completed.isEmpty
                    ? const Center(
                  child: Text(
                    'No completed exercises yet',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
                    : ListView.builder(
                  itemCount: completedService.completed.length,
                  itemBuilder: (context, index) {
                    final exercise = completedService.completed[index];

                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(exercise.name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                          const Icon(Icons.check_circle, color: Colors.green),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
