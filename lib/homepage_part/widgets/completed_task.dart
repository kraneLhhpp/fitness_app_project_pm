import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const [
          _CompletedTaskItem(
            label1: '10 km Cycling Tour',
            label2: '92% done',
            imgPath: 'assets/images/cycleIcon.png',
          ),
          _CompletedTaskItem(
            label1: '25 km Power Marathon',
            label2: '100% done',
            imgPath: 'assets/images/runIcon.png',
          ),
        ],
      ),
    );
  }
}

class _CompletedTaskItem extends StatelessWidget {
  final String label1;
  final String label2;
  final String imgPath;

  const _CompletedTaskItem({
    required this.label1,
    required this.label2,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pinkAccent),
        boxShadow: [
          BoxShadow(color: Colors.pinkAccent, blurRadius: 6, spreadRadius: 1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60, child: Image.asset(imgPath)),
            SizedBox(height: 7.5),
            Text(
              label1,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              label2,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            LinearPercentIndicator(
              backgroundColor: Color(0xff4f9ff3),
              lineHeight: 10,
              width: 300,
              progressColor: Colors.pink,
              percent: 0.23,
              barRadius: Radius.circular(25),
            ),
          ],
        ),
      ),
    );
  }
}
