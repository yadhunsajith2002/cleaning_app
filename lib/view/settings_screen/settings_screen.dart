import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = SizedBox(
      height: 35,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    ),
                    Text(
                      " Christian,",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height,
                    settingsTile(icon: Icons.person, title: "Profile"),
                    height,
                    settingsTile(icon: Icons.search, title: "Search"),
                    height,
                    settingsTile(
                        icon: Icons.security, title: "Account Secuirity"),
                    height,
                    settingsTile(icon: Icons.settings, title: "Settings"),
                    height,
                    settingsTile(
                        icon: Icons.privacy_tip, title: "Privacy and policy"),
                    height,
                    settingsTile(icon: Icons.logout, title: "Logout"),
                    height,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile settingsTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          )),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
    );
  }
}
