import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isScrolled;

  const Header({
    super.key,
    required this.isScrolled,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: isScrolled ? Colors.white : Colors.transparent,
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 15,
                ),
              ]
            : [],
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

          mobile
              ? Builder(
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: isScrolled ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )
              : Row(
                  children: [
                    _navButton("Home", isScrolled),
                    _navButton("Career", isScrolled),
                    _navButton("Location", isScrolled),
                    _navButton("About Us", isScrolled),
                    _navButton("Contact Us", isScrolled),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _navButton(String title, bool isScrolled) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: isScrolled ? Colors.black87 : Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}