import 'package:flutter/material.dart';

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff003253);
    Path path = Path()
      ..relativeLineTo(0, 100)
      ..relativeQuadraticBezierTo(size.width / 2, 100, size.width, 0)
      ..relativeLineTo(0, -100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
