import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DotPainter extends CustomPainter {
  DotPainter({this.color = Colors.black});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Dot extends StatelessWidget {
  const Dot({Key? key, this.color = Colors.black54}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 3,
      child: CustomPaint(
        painter: DotPainter(color: color),
      ),
    );
  }
}
