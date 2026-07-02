  import 'package:flutter/material.dart';
  import 'package:ldtc_blog/Pages/career_page.dart';
  import '../pages/home_page.dart';




  class Header extends StatelessWidget {
    final bool isScrolled;
    final bool mobile;
    final GlobalKey<ScaffoldState>? scaffoldKey;
    final VoidCallback? onServicesTap;
    final VoidCallback? onAboutTap;

    const Header({
      super.key,
      required this.isScrolled,
      required this.mobile,
      this.scaffoldKey,
      this.onServicesTap,
      this.onAboutTap,
    });

    
    @override
    Widget build(BuildContext context) {
      
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
            children: [
              // LEFT - LOGO
              const Text(
                "ABA LDTC",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B59FF),
                ),
              ),

              // CENTER
              Expanded(
                child: Center(
                  child: !mobile 
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _navButton(
                              context,
                              "Home",
                              isScrolled,
                              const HomePage(),
                            ),

                            TextButton(
                                  onPressed: onServicesTap,
                                  child: Text(
                                    "Services",
                                    style: TextStyle(
                                      color: isScrolled ? Colors.black87 : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                            _navButton(
                              context,
                              "Career",
                              isScrolled,
                              const CareerPage(),
                            ),

                                    
                            PopupMenuButton<String>(
                              key: ValueKey(mobile),
                              offset: const Offset(0, 40),
                              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "Location",
                                style: TextStyle(
                                  color: isScrolled
                                      ? Colors.black87
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
                            
                            _navButton(
                              context,
                              "About Us",
                              isScrolled,
                              null,
                            ),
                          ],
                        )   
                        :const SizedBox(), // walang menu sa mobile  
                ),
              ),

              // RIGHT
              mobile
                  ? IconButton(
                      icon: Icon(
                        Icons.menu,
                        color:
                            isScrolled ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        scaffoldKey?.currentState?.openDrawer();
                      },
                    )
                  : ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF7ED957),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text("Contact Us"),
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

