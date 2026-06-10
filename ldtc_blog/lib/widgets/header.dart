import 'package:flutter/material.dart';
import 'package:ldtc_blog/Pages/career_page.dart';
import '../pages/home_page.dart';


class Header extends StatelessWidget {
  final bool isScrolled;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const Header({
    super.key,
    required this.isScrolled,
    this.scaffoldKey,
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
              ? IconButton(
                  
                    icon: Icon(
                      Icons.menu,
                      color: isScrolled ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      scaffoldKey?.currentState?.openDrawer();
                    },
                  
                )
              : Row(
                children: [
                  _navButton(
                    context,
                    "Home",
                    isScrolled,
                    const HomePage(),),

                  _navButton(
                    context,
                    "Career",
                    isScrolled,
                    const CareerPage(),
                  ),

                  _navButton(context, "Location", isScrolled, null),
                  _navButton(context, "About Us", isScrolled, null),
                  _navButton(context, "Contact Us", isScrolled, null),
                  ],
                ),
        ],
      ),
    );
  }

    Widget _navButton(
    BuildContext context,
    String title,
    bool isScrolled,
    Widget? page,
  ) {
    return TextButton(
      onPressed: () {
        if (page != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );  
        }
      },
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