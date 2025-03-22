import 'package:flutter/material.dart';
import 'triangle_painter.dart';

class TriangleTouchScreen extends StatefulWidget {
  @override
  _TriangleTouchScreenState createState() => _TriangleTouchScreenState();
}

class _TriangleTouchScreenState extends State<TriangleTouchScreen> {
  // Khởi tạo 3 đỉnh của tam giác
  List<Offset> points = [Offset(100, 200), Offset(250, 100), Offset(400, 300)];

  int? selectedPointIndex; // Đỉnh đang được kéo

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        // Kiểm tra xem người dùng có chạm vào đỉnh nào không
        for (int i = 0; i < points.length; i++) {
          if ((points[i] - details.localPosition).distance < 30) {
            selectedPointIndex = i;
            break;
          }
        }
      },
      onPanUpdate: (details) {
        if (selectedPointIndex != null) {
          setState(() {
            points[selectedPointIndex!] =
                details.localPosition; // Cập nhật vị trí
          });
        }
      },
      onPanEnd: (details) {
        selectedPointIndex = null; // Thả ngón tay ra
      },
      child: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: TrianglePainter(points),
      ),
    );
  }
}
