import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/job_card.dart';
import '../widgets/mobile_drawer.dart';




class CareerPage extends StatefulWidget {
  const CareerPage({super.key});

  @override
  State<CareerPage> createState() => _CareerPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey =
    GlobalKey<ScaffoldState>();


  final ScrollController _controller = ScrollController();

  bool isScrolled = false;



class _CareerPageState extends State<CareerPage> {
  final ScrollController _controller = ScrollController();

  bool isScrolled = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final scrolled = _controller.offset > 20;

      if (scrolled != isScrolled) {
        setState(() {
          isScrolled = scrolled;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      key: _scaffoldKey,
        drawer: mobile ? const MobileDrawer() : null,
        body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                const SizedBox(height: 100),

                // HERO SECTION
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 50,
                  ),
                  color: const Color(0xFFF5F7FB),
                  child: const Center(
                    child: Text(
                      "Careers",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // IMAGE + TEXT
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 80,
                  ),
                  child: mobile
                      ? Column(
                          children: [
                            _careerImage(),
                            const SizedBox(height: 30),
                            _careerText(),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: _careerImage()),
                            const SizedBox(width: 50),
                            Expanded(child: _careerText()),
                          ],
                        ),
                ),

                // OPEN VACANCIES
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Open ",
                          style: TextStyle(
                            color: Color(0xFF7ED957),
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Vacancies",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // JOB CARDS
 // JOB CARDS

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 30,
    vertical: 40,
  ),
  child: const Column(
    children: [
      JobCard(title: "ABA Therapy"),
      SizedBox(height: 20),

      JobCard(title: "Occupational Therapy"),
      SizedBox(height: 20),

      JobCard(title: "Speech Therapy"),
      SizedBox(height: 20),

      JobCard(title: "SPED Tutorial"),
    ],
  ),
),                 


           const SizedBox(height: 80),
              ],
            ),
          ),

          Header(
            isScrolled: isScrolled,
            scaffoldKey: _scaffoldKey,
          ),
        ],
      ),
    );
  }

  Widget _careerImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/images/career.jpg",
        height: 600,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _careerText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Join Our Team",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "We are looking for passionate professionals who are dedicated to helping children reach their full potential. Join our growing team and make a meaningful impact in the lives of families.",
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}

