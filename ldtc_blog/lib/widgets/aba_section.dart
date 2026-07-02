import 'package:flutter/material.dart';
import 'rotating_gallery.dart';
import 'about_content.dart';


class AbaSection extends StatelessWidget {
  const AbaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 80,
        vertical: 80,
      ),
      child: Column(
        children: [

          /// Heading
          Text(
            "Emotional and Behavioral Support for Children",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mobile ? 28 : 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xff0D5C63),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: 900,
            child: Text(
              "Our team strives to make every therapy session a positive, enjoyable, and comfortable experience for children.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: mobile ? 18 : 22,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 70),

          mobile
              ? Column(
                  children: [
                    const RotatingGallery(),
                    const SizedBox(height: 40),
                    _content(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 120), // itutulak ang text pakanan

                    Expanded(
                      flex: 1,
                      child: AboutContent(),
                    ),

                    const SizedBox(width: 30),

                    const Expanded(
                      flex: 1,
                      child: RotatingGallery(),
                    ),
                  ],
                )
        ],
      ),
    );
  }

  Widget _content() => const AboutContent();
}