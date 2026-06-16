import 'package:flutter/material.dart';
import 'package:ldtc_blog/Pages/career_page.dart';
import '../pages/home_page.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ABA Therapy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B59FF),
                ),
              ),
            ),
          ),

          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomePage(),
                ),
              );
            },
          ),

ListTile(
            title: const Text("Services"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomePage(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text("Career"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const CareerPage(),
                ),
              );
            },
          ),

          ExpansionTile(
            title: const Text("Location"),
            children: [
              ListTile(
                title: const Text("Valenzuela"),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text("Roosevelt"),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text("Tandang Sora"),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text("Bulacan"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),

          ListTile(
            title: const Text("About Us"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}