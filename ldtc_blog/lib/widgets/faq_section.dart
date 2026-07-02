import 'dart:async';
import 'package:flutter/material.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
  
}
final faqs = [
  {
    "title": "What services do you offer?",
    "body":
        "We provide evidence-based therapy services designed to support children with developmental, behavioral, communication, and learning needs."
  },
  {
    "title": "Who can benefit from your therapy programs?",
    "body":
        "Our services are designed for children who may need support in communication, behavior, learning and development."
  },
  {
    "title": "Do I need an appointment before visiting?",
    "body":
        "Yes. We encourage parents to schedule an appointment before visiting."
  },
  {
    "title": "How are payments made for your services?",
    "body":
        "We accept cash, bank transfer, GCash and other available payment methods."
  },
  {
    "title": "How often should my child attend therapy?",
    "body":
        "The schedule depends on the therapist's assessment."
  },
  {
    "title": "Can parents participate in the therapy process?",
    "body":
        "Absolutely. Parent participation is highly encouraged."
  },
  {
    "title": "What should I bring during my child's first visit?",
    "body":
        "Please bring previous reports and your child's basic information."
  },
];
class _FAQSectionState extends State<FAQSection> {
  final PageController _pageController = PageController();

  int currentPage = 0;
  Timer? timer;


  final List<String> images = [
    "assets/images/faq1.jpg",
    "assets/images/faq2.jpg",
    "assets/images/faq3.jpg",
    "assets/images/faq4.jpg",
    "assets/images/faq5.jpg",
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      currentPage++;

      if (currentPage >= images.length) {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final mobile = MediaQuery.of(context).size.width < 900;

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 1250, // <-- Baguhin mo ito (1000,1100,1200,1300...)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 20 : 40,
          vertical: 80,
        ),
        child: mobile
            ? Column(
                children: [
                  _buildFAQ(),
                  const SizedBox(height: 30),
                  _buildSlider(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildFAQ(),
                  ),

                  const SizedBox(width: 60),

                  Expanded(
                    flex: 5,
                    child: _buildSlider(),
                  ),
                ],
              ),
      ),
    ),
  );
}

  Widget _buildSlider() {
  final width = MediaQuery.of(context).size.width;

  double height;

  if (width < 768) {
    height = 350;
  } else if (width < 1200) {
    height = 500;
  } else {
    height = 700;
  }

  return SizedBox(
    height: height,
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Image.asset(
            images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    ),
  );
}

  Widget _buildFAQ() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "FAQ",
          style: TextStyle(
            color: Colors.green,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Welcome to ABA Learning\nDifference Therapy Center",
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          "We are committed to providing compassionate, individualized, and evidence-based therapy services to help every child reach their fullest potential. Below are the answers to some of the questions most frequently asked by our parents and caregivers.",
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
          ),
        ),

        const SizedBox(height: 35),

        ExpansionPanelList.radio(
  elevation: 2,
  expandedHeaderPadding: EdgeInsets.zero,
  children: faqs.map((faq) {
    return ExpansionPanelRadio(
      value: faq["title"]!,
      headerBuilder: (context, isExpanded) {
        return ListTile(
          title: Text(
            faq["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Text(
          faq["body"]!,
          style: const TextStyle(
            height: 1.7,
          ),
        ),
      ),
    );
  }).toList(),
),
      ],
    );
  }
Widget faqTile(String title, String body) {
  return Card(
    elevation: 2,
    margin: const EdgeInsets.only(bottom: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
      side: BorderSide(
        color: Colors.green.shade100,
      ),
    ),
    child: ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
          child: Text(
            body,
            style: const TextStyle(height: 1.6),
          ),
        ),
      ],
    ),
  );
}
}