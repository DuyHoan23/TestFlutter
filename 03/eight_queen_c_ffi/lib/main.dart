import 'package:flutter/material.dart';
import 'screens/queen_screen.dart';

void main() {
  runApp(ChessApp());
}

class ChessApp extends StatelessWidget {
  const ChessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QueenScreen());
  }
}
