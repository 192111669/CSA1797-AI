def is_safe(board, row, col):
    for i in range(col):
        if board[row][i] == 1:
            return False
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j] == 1:
            return False
    for i, j in zip(range(row, N, 1), range(col, -1, -1)):
        if board[i][j] == 1:
            return False

    return True

def solve_queens(board, col):
    if col >= N:
        return True

    for i in range(N):
        if is_safe(board, i, col):
            board[i][col] = 1
            if solve_queens(board, col + 1):
                return True
            board[i][col] = 0

    return False

def print_solution(board):
    for i in range(N):
        for j in range(N):
            print(board[i][j], end=" ")
        print()

N = 8
chess_board = [[0] * N for _ in range(N)]

if solve_queens(chess_board, 0):
    print("Solution exists. Placements of Queens:")
    print_solution(chess_board)
else:
    print("No solution exists for the given board size.")
