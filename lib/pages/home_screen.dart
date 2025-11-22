import 'package:fitness_app_project/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/widgets/daily_report_button.dart';
import 'package:fitness_app_project/widgets/habits_section.dart';
import 'package:fitness_app_project/widgets/header.dart';
import 'package:fitness_app_project/widgets/training_days.dart';
import 'package:fitness_app_project/widgets/workout_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/avatarImg.png'),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Hello,',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Text(
                        'Thomas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(title: Text('Home'), onTap: () {}),
            ListTile(title: Text('Activity tracking'), onTap: () {}),
            ListTile(title: Text('Activity history'), onTap: () {}),
            ListTile(title: Text('Challenges'), onTap: () {}),
            ListTile(title: Text('Community'), onTap: () {}),
            ListTile(title: Text('Nutrition'), onTap: () {}),
            ListTile(title: Text('Resources'), onTap: () {}),
            Divider(),
            ListTile(title: Text('Profile'), onTap: () {}),
            ListTile(title: Text('Setting'), onTap: () {}),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WorkoutCard(),
              SizedBox(height: 30.0),

              Text(
                'What are you training today?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              TrainingDays(),
              SizedBox(height: 30.0),

              Text(
                'Your habits',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              HabitsSection(),
              SizedBox(height: 30.0),

              DailyReportsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
