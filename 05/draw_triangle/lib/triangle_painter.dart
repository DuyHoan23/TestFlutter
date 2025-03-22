import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final List<Offset> points; // Danh sách 3 đỉnh tam giác

  TrianglePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 4
          ..style = PaintingStyle.fill; // Kiểu tô màu

    final path =
        Path()
          ..moveTo(points[0].dx, points[0].dy)
          ..lineTo(points[1].dx, points[1].dy)
          ..lineTo(points[2].dx, points[2].dy)
          ..close(); // Đóng đường vẽ

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
