import 'package:flutter/material.dart';
import '../models/queen_solver.dart';

class ChessBoardScreen extends StatefulWidget {
  @override
  _ChessBoardScreenState createState() => _ChessBoardScreenState();
}

class _ChessBoardScreenState extends State<ChessBoardScreen> {
  int currentSolutionIndex = 0;

  @override
  void initState() {
    super.initState();
    generateSolutions();
  }

  void _nextSolution() {
    setState(() {
      currentSolutionIndex = (currentSolutionIndex + 1) % solutions.length;
    });
  }

  void _prevSolution() {
    setState(() {
      currentSolutionIndex =
          (currentSolutionIndex - 1 + solutions.length) % solutions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("8 Queens Solutions")),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            _nextSolution();
          } else if (details.primaryVelocity! > 0) {
            _prevSolution();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Solution ${currentSolutionIndex + 1} / ${solutions.length}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              _buildChessBoard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChessBoard() {
    List<int> board = solutions[currentSolutionIndex];

    return Container(
      width: 320,
      height: 320,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemCount: 64,
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;
          bool isQueen = board[row] == col;
          bool isWhite = (row + col) % 2 == 0;

          return Container(
            decoration: BoxDecoration(
              color: isWhite ? Colors.white : Colors.black,
              border: Border.all(color: Colors.grey),
            ),
            child:
                isQueen
                    ? Center(
                      child: Text(
                        "♛",
                        style: TextStyle(fontSize: 24, color: Colors.red),
                      ),
                    )
                    : null,
          );
        },
      ),
    );
  }
}
