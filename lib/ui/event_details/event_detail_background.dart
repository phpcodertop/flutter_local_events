import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/event.dart';

class EventDetailBackground extends StatelessWidget {
  const EventDetailBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.topCenter,
        child: ClipPath(
          clipper: ImageClipper(),
          child: Image.asset(
            event.imagePath,
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight * 0.5,
            color: const Color(0x99000000),
            colorBlendMode: BlendMode.darken,
          ),
        ),
    );
  }
}

class ImageClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = const Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.85, curveEndPoint.dx - 60, curveEndPoint.dy + 15);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.99, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
