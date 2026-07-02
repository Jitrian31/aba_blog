import 'package:flutter/material.dart';

class StatsBackground extends StatelessWidget {
  final Widget child;

  const StatsBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CloudClipper(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 45,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 124, 241, 104),
          border: Border.all(
            color: const Color.fromARGB(255, 57, 125, 37),
            width: 3,
          ),  
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(0,8),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}

class CloudClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height * .72);

    // Left bottom bubble
    path.quadraticBezierTo(
      0,
      size.height * .48,
      size.width * .08,
      size.height * .45,
    );

    // Left top bubble
    path.quadraticBezierTo(
      size.width * .10,
      size.height * .18,
      size.width * .30,
      size.height * .20,
    );

    // Center mountain
    path.quadraticBezierTo(
      size.width * .40,
      -10,
      size.width * .53,
      size.height * .05,
    );

    // Right top bubble
    path.quadraticBezierTo(
      size.width * .67,
      -10,
      size.width * .78,
      size.height * .20,
    );

    // Right side
    path.quadraticBezierTo(
      size.width * .97,
      size.height * .12,
      size.width,
      size.height * .48,
    );

    path.quadraticBezierTo(
      size.width,
      size.height * .78,
      size.width * .90,
      size.height * .82,
    );

    // Bottom
    path.quadraticBezierTo(
      size.width * .70,
      size.height,
      size.width * .50,
      size.height * .96,
    );

    path.quadraticBezierTo(
      size.width * .25,
      size.height,
      size.width * .08,
      size.height * .82,
    );

    path.quadraticBezierTo(
      0,
      size.height * .80,
      0,
      size.height * .72,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
