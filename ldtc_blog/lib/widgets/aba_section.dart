import 'package:flutter/material.dart';

import 'rotating_gallery.dart';

class AbaSection extends StatelessWidget {
  const AbaSection({super.key});
  

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 80,
      ),
      child: mobile
          ? Column(
              children: [
                _content(),
                const SizedBox(height: 40),
                const RotatingGallery(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _content()),
                const Expanded(
                  child: RotatingGallery(),
                ),
              ],
            ),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About Our Therapy Center",
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
           '''ABA Learning Difference Therapy Center is a private, multi-branch developmental
and behavioral intervention facility in the Philippines that specializes in supporting children and teens with special needs

Guided by the motto "No child will be left behind," the center provides 
evidence-based practices to help neurodivergent individuals and children with developmental disabilities build crucial life skills.
            ''',
  style: TextStyle(
    fontSize: 20,
    height: 1.6,
    color: Colors.black87,
  )
),

        const SizedBox(height: 30),

        ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF7ED957),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "Explore About ABA LDTC",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 10),
      Icon(Icons.arrow_forward),
      ],
    ),
  ),
      ],
    );
  }
}

