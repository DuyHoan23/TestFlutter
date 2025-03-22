import 'package:flutter/material.dart';
import 'screens/chess_board.dart';

void main() {
  runApp(ChessBoardApp());
}

class ChessBoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ChessBoard());
  }
}
