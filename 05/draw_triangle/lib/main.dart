import 'package:flutter/material.dart';
import 'touch_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Vẽ tam giác đa chạm")),
        body: TriangleTouchScreen(),
      ),
    );
  }
}
