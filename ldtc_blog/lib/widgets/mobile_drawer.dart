import 'package:flutter/material.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text(
              "ABA Therapy",
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(title: Text("Home")),
          ListTile(title: Text("Career")),
          ExpansionTile(
            title: Text("Location"),
            children: [
              ListTile(title: Text("Valenzuela")),
              ListTile(title: Text("Roosevelt")),
              ListTile(title: Text("Tandang Sora")),
              ListTile(title: Text("Bulacan")),
            ],
          ),
          ListTile(title: Text("About Us")),
          ListTile(title: Text("Contact Us")),
        ],
      ),
    );
  }
}