List<List<int>> solutions = [];

bool isSafe(List<int> board, int row, int col) {
  for (int i = 0; i < row; i++) {
    if (board[i] == col || (i - row).abs() == (board[i] - col).abs()) {
      return false;
    }
  }
  return true;
}

void solveNQueens(int row, List<int> board) {
  if (row == 8) {
    solutions.add(List.from(board));
    return;
  }
  for (int col = 0; col < 8; col++) {
    if (isSafe(board, row, col)) {
      board[row] = col;
      solveNQueens(row + 1, board);
    }
  }
}

void generateSolutions() {
  solutions.clear();
  solveNQueens(0, List.filled(8, -1));
}
