import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/bottom_navigation_pages/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutplanStep5Page extends StatefulWidget {
  const WorkoutplanStep5Page({super.key});

  @override
  State<WorkoutplanStep5Page> createState() => _WorkoutplanStep5PageState();
}

class _WorkoutplanStep5PageState extends State<WorkoutplanStep5Page> {
  int? selectedIndex;

  final List<String> options = ["No, I don’t have", "Yes, I have"];
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Add a new Goal",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Spacer(),
            Icon(Icons.sports_gymnastics_rounded),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.grey[200], width: 50, height: 5),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Till when you want to fulfill your goal?",
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.pinkAccent,
                    fontSize: 30,
                  ),
                ),
              ),
              PickDate(
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedDate != null
                      ? () {
                          final user = FirebaseAuth.instance.currentUser;

                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  BottomNavigation(user: user!),
                              transitionDuration: Duration.zero,
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedDate != null
                        ? Colors.pinkAccent
                        : Colors.pinkAccent.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PickDate extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const PickDate({required this.onDateSelected, super.key});

  @override
  _PickDateState createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  int selectedMonth = 0;
  int selectedDay = 0;
  int selectedYear = 0;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<int> years = List.generate(20, (i) => 2020 + i);
  final List<int> days = List.generate(31, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Row(
            children: [
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(initialItem: 2),
                  onSelectedItemChanged: (value) {
                    setState(() => selectedMonth = value);
                  },
                  children: months
                      .map(
                        (e) => Center(
                          child: Text(e, style: TextStyle(fontSize: 20)),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: 15,
                  ),
                  onSelectedItemChanged: (value) {
                    setState(() => selectedDay = value);
                  },
                  children: days
                      .map(
                        (e) => Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(initialItem: 3),
                  onSelectedItemChanged: (value) {
                    setState(() => selectedYear = value);
                  },
                  children: years
                      .map(
                        (e) => Center(
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: () {
            final date = DateTime(
              years[selectedYear],
              selectedMonth + 1,
              days[selectedDay],
            );
            widget.onDateSelected(date);
          },
          child: Text(
            "Select Date",
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
