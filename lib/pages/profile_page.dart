import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Heading",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Profile Subheading",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Adjust the width as needed
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            Column(
              children: [
                _profileMenuItem(context, "Settings", Icons.settings, () {}),
                _profileMenuItem(context, "Billing Details",
                    Icons.account_balance_wallet, () {}),
                _profileMenuItem(
                    context, "User Management", Icons.person_outline, () {}),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            _profileMenuItem(context, "Information", Icons.info_outline, () {}),
            _profileMenuItem(context, "Logout", Icons.logout, () {
              signout();
              // Logout functionality
            }, textColor: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _profileMenuItem(
      BuildContext context, String title, IconData icon, VoidCallback onPressed,
      {Color? textColor}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onPressed,
    );
  }
}
