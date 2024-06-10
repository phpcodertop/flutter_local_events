import 'package:flutter/material.dart';

class HomepageBackground extends StatelessWidget {
  final double screenHeight;

  const HomepageBackground({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        color: themeData.primaryColor,
        height: screenHeight * 0.5,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();

    Offset curveStarPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);

    path.lineTo(curveStarPoint.dx, curveStarPoint.dy);
    path.quadraticBezierTo(size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
