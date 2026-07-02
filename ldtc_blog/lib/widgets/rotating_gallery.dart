import 'dart:async';  
import 'package:flutter/material.dart';


class RotatingGallery extends StatefulWidget {
  const RotatingGallery({super.key});


  @override
  State<RotatingGallery> createState() => _RotatingGalleryState();
    

}   

class _RotatingGalleryState extends State<RotatingGallery> {
  int currentIndex = 0;

  Timer? timer;
  
  final images = [
    "assets/images/ABA1.jpg",
    "assets/images/ABA2.jpg",
    "assets/images/ABA3.jpg",
    "assets/images/ABA4.jpg",
    "assets/images/ABA5.jpg",
    "assets/images/ABA6.jpg",
    "assets/images/ABA7.jpg",
  ];

  void nextImage() {
        setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

    @override
        void initState() {
          super.initState();

          timer = Timer.periodic(
            const Duration(seconds: 15),
            (_) {
              if (mounted) {
                nextImage();
              }
            },
          );
        }

    void prevImage() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

return SizedBox(
  width: mobile ? 300 : 500,
  height: mobile ? 300 : 450,
  child: Stack(
    alignment: Alignment.center,
    children: [
      GestureDetector(
  onHorizontalDragEnd: (details) {

    // Swipe Left → Next
    if (details.primaryVelocity! < 0) {
      nextImage();
    }

    // Swipe Right → Previous
    if (details.primaryVelocity! > 0) {
      prevImage();
    }
  },

  child: AnimatedSwitcher(
    duration: const Duration(milliseconds: 1200),
    transitionBuilder: (child, animation) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    child: Container(
      key: ValueKey(images[currentIndex]),
      width: mobile ? 220 : 300,
      height: mobile ? 220 : 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(images[currentIndex]),
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
),

      if (!mobile)
        Positioned(
          left: 100,
          child: IconButton(
            onPressed: prevImage,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),

      if (!mobile)
        Positioned(
          right: 100,
          child: IconButton(
            onPressed: nextImage,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
    ],
  ),
);
}
      @override
      void dispose() {
        timer?.cancel();
        super.dispose();
      }
}