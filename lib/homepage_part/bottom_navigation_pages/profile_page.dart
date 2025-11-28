import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/main_menu_pages/edit_profile_page.dart';
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
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
       return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final name = currentUser.displayName ?? "User";
    final email = currentUser.email ?? "";
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent,
                          Colors.pink.shade200,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/avatarImg.png',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            _ProfileTile(
              icon: Icons.person_outline,
              title: "Edit Profile",
              onTap: () async{
                await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) =>  EditProfilePage(user: widget.user),
                  )
                );
                setState(() {});
              },
            ),
            _ProfileTile(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {},
            ),

            const SizedBox(height: 25),

            const Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            _ProfileTile(
              icon: Icons.notifications_outlined,
              title: "Notifications",
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.color_lens_outlined,
              title: "Appearance",
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.info_outline,
              title: "About App",
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.logout_rounded, 
              title: 'Log Out', 
              onTap: () async {
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
                      SnackBar(
                        content: Text('Failed to log out: $e'),
                      ),
                    );
                  }
                },
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Icon(icon, color: Colors.pinkAccent),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
