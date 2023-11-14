from queue import PriorityQueue
def manhattan_distance(state):
    goal_state = [[1, 2, 3], [4, 5, 6], [7, 8, 0]]
    distance = 0
    for i in range(3):
        for j in range(3):
            if state[i][j] != 0:
                row = (state[i][j] - 1) // 3
                col = (state[i][j] - 1) % 3
                distance += abs(i - row) + abs(j - col)
    return distance
def get_possible_moves(state):
    moves = []
    zero_pos = [(i, j) for i, row in enumerate(state) for j, val in enumerate(row) if val == 0][0]
    i, j = zero_pos

    if i > 0:
        new_state = [row[:] for row in state]
        new_state[i][j], new_state[i - 1][j] = new_state[i - 1][j], new_state[i][j]
        moves.append(new_state)

    if i < 2:
        new_state = [row[:] for row in state]
        new_state[i][j], new_state[i + 1][j] = new_state[i + 1][j], new_state[i][j]
        moves.append(new_state)

    if j > 0:
        new_state = [row[:] for row in state]
        new_state[i][j], new_state[i][j - 1] = new_state[i][j - 1], new_state[i][j]
        moves.append(new_state)

    if j < 2:
        new_state = [row[:] for row in state]
        new_state[i][j], new_state[i][j + 1] = new_state[i][j + 1], new_state[i][j]
        moves.append(new_state)

    return moves
def solve_puzzle(start):
    priority_queue = PriorityQueue()
    priority_queue.put((0, start))
    visited_states = set()
    
    while not priority_queue.empty():
        current = priority_queue.get()
        current_state = current[1]
        if current_state == [[1, 2, 3], [4, 5, 6], [7, 8, 0]]:
            return current_state
        
        visited_states.add(tuple(map(tuple, current_state)))
        for move in get_possible_moves(current_state):
            if tuple(map(tuple, move)) not in visited_states:
                priority_queue.put((manhattan_distance(move), move))
    
    return "No solution found."
initial_state = [
    [1, 2, 3],
    [4, 5, 0],
    [7, 8, 6]
]
solution = solve_puzzle(initial_state)
if solution != "No solution found.":
    print("Solution found:")
    for row in solution:
        print(row)
else:
    print("No solution exists for the given initial state.")
