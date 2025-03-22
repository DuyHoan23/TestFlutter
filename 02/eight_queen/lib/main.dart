import 'package:flutter/material.dart';
import 'screens/chess_board.dart';

void main() {
  runApp(ChessApp());
}

class ChessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChessBoardScreen(),
    );
  }
}
