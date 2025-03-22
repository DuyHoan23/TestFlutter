import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  @override
  _ChessBoardState createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  int queenRow = 3;
  int queenColumn = 4;

  void placeQueen(int row, int column) {
    setState(() {
      queenRow = row;
      queenColumn = column;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chess Board")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemCount: 64,
              itemBuilder: (context, index) {
                int row = index ~/ 8;
                int col = index % 8;
                bool isQueen = (row == queenRow && col == queenColumn);
                bool isWhite = (row + col) % 2 == 0;

                return GestureDetector(
                  onTap: () => placeQueen(row, col),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isWhite ? Colors.white : Colors.black,
                      border: Border.all(color: Colors.grey),
                    ),
                    child:
                        isQueen
                            ? Center(
                              child: Text(
                                "♛",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.red,
                                ),
                              ),
                            )
                            : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
