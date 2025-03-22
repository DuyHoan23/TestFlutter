#include <stdio.h>
#include <stdlib.h>

#define N 8
int solutions[92][N];
int solutionCount = 0;

int isSafe(int board[N], int row, int col) {
    for (int i = 0; i < row; i++) {
        if (board[i] == col || (i - row) == (board[i] - col) || (i - row) == (col - board[i])) {
            return 0;
        }
    }
    return 1;
}

void solve(int board[N], int row) {
    if (row == N) {
        for (int i = 0; i < N; i++) {
            solutions[solutionCount][i] = board[i];
        }
        solutionCount++;
        return;
    }
    for (int col = 0; col < N; col++) {
        if (isSafe(board, row, col)) {
            board[row] = col;
            solve(board, row + 1);
        }
    }
}

int* get_solutions(int* count) {
    static int board[N];
    solutionCount = 0;
    solve(board, 0);
    *count = solutionCount;
    return (int*)solutions;
}
