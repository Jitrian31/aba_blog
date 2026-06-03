import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const Text(
            "ABA Therapy",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B59FF),
            ),
          ),

          if (!mobile)
            Row(
              children: [
                _navButton("Home"),
                _navButton("Career"),

                PopupMenuButton<String>(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Location",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: "Valenzuela",
                      child: Text("Valenzuela"),
                    ),
                    PopupMenuItem(
                      value: "Roosevelt",
                      child: Text("Roosevelt"),
                    ),
                    PopupMenuItem(
                      value: "Tandang Sora",
                      child: Text("Tandang Sora"),
                    ),
                    PopupMenuItem(
                      value: "Bulacan",
                      child: Text("Bulacan"),
                    ),
                  ],
                ),

                _navButton("About Us"),
                _navButton("Contact Us"),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navButton(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}