import 'dart:math';

import 'package:flutter/material.dart';

class RotatingGallery extends StatefulWidget {
  const RotatingGallery({super.key});

  @override
  State<RotatingGallery> createState() => _RotatingGalleryState();
}

class _RotatingGalleryState extends State<RotatingGallery>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  final images = [
    "https://picsum.photos/id/1015/500/500",
    "https://picsum.photos/id/1025/500/500",
    "https://picsum.photos/id/1035/500/500",
    "https://picsum.photos/id/1045/500/500",
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 350,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Transform.rotate(
            angle: controller.value * 2 * pi,
            child: Stack(
              alignment: Alignment.center,
              children: List.generate(
                images.length,
                (index) {
                  final angle =
                      (2 * pi / images.length) * index;

                  return Transform.translate(
                    offset: Offset(
                      cos(angle) * 120,
                      sin(angle) * 120,
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          NetworkImage(images[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}