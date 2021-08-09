import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:quinn/utils/app_colors.dart';


class LogoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
    // ..color = color
      ..shader = LinearGradient(
        colors: [AppColors.themeOrangeColor, AppColors.themeOrangeColor],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        transform: GradientRotation(math.pi),)
          .createShader(Rect.fromCircle(center: Offset(size.width / 2,
          size.height), radius: size.width / 2
      ));

    Offset circleCenter = Offset(size.width / 2, size.height);

    Offset topLeft = Offset(0, 0);
    Offset bottomLeft = Offset(0, size.height);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height);

    Offset leftCurveControlPoint = Offset(circleCenter.dx, size.height * 1.5);
    Offset rightCurveControlPoint = Offset(circleCenter.dx, size.height * 0.3);


    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..cubicTo(bottomLeft.dx, bottomLeft.dy,
          leftCurveControlPoint.dx, leftCurveControlPoint.dy,
          bottomRight.dx, bottomRight.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy, bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}