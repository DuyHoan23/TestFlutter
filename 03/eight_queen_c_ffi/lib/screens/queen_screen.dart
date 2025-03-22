import 'package:flutter/material.dart';
import '../ffi/queen_solver.dart';

class QueenScreen extends StatefulWidget {
  const QueenScreen({super.key});

  @override
  _QueenScreenState createState() => _QueenScreenState();
}

class _QueenScreenState extends State<QueenScreen> {
  final QueenSolver solver = QueenSolver();
  List<List<int>> solutions = [];
  int currentSolutionIndex = 0;

  @override
  void initState() {
    super.initState();
    solutions = solver.solve();
  }

  void nextSolution() {
    setState(() {
      currentSolutionIndex = (currentSolutionIndex + 1) % solutions.length;
    });
  }

  void previousSolution() {
    setState(() {
      currentSolutionIndex =
          (currentSolutionIndex - 1 + solutions.length) % solutions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("8 Queens Solutions")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Solution ${currentSolutionIndex + 1}/${solutions.length}"),
          SizedBox(height: 10),
          _buildChessBoard(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: previousSolution,
                child: Text("Previous"),
              ),
              SizedBox(width: 10),
              ElevatedButton(onPressed: nextSolution, child: Text("Next")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChessBoard() {
    List<int> solution = solutions[currentSolutionIndex];

    return SizedBox(
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
          bool isQueen = solution[row] == col;
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
