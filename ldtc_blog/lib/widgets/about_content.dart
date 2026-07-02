import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

 @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Our Therapy Center",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 30),

        Text(
          '''ABA Learning Difference Therapy Center is a private, multi-branch developmental and behavioral intervention facility in the Philippines that specializes in supporting children and teens with special needs.

Guided by the motto "No child will be left behind," the center provides evidence-based practices to help neurodivergent individuals and children with developmental disabilities build crucial life skills.''',
          style: TextStyle(
            fontSize: 19,
            height: 1.8,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 35),

        _feature(
            "Personalized ABA therapy tailored to your child’s individual needs."),

        _feature(
            "Guidance and support for parents to encourage continued progress at home."),

        _feature(
            "Fun and motivating activities designed to keep children engaged and comfortable."),

        _feature(
            "Comprehensive evaluations to develop effective and goal-oriented treatment plans."),

        SizedBox(height: 35),

        ElevatedButton.icon(
          onPressed: () {},
          icon: Text(
            "Explore About ABA LDTC",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          label: Icon(Icons.arrow_forward),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7ED957),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 18,
            ),
            shape: StadiumBorder(),
          ),
        ),
      ],
    
    );
  }

  Widget _feature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 24,
          ),

          SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}