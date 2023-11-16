import itertools

def calculate_total_distance(path, distances):
    total_distance = 0
    for i in range(len(path) - 1):
        total_distance += distances[path[i]][path[i+1]]
    total_distance += distances[path[-1]][path[0]] 
    return total_distance

def traveling_salesman_bruteforce(distances):
    num_cities = len(distances)
    cities = list(range(num_cities))
    shortest_path = None
    shortest_distance = float('inf')

    for path in itertools.permutations(cities):
        total_distance = calculate_total_distance(path, distances)
        if total_distance < shortest_distance:
            shortest_distance = total_distance
            shortest_path = path

    return shortest_path, shortest_distance

if __name__ == "__main__":
  
    distances = [
        [0, 21, 18, 12],
        [21, 0, 15, 19],
        [18, 15, 0, 13],
        [12, 19, 13, 0]
    ]

    shortest_path, shortest_distance = traveling_salesman_bruteforce(distances)
    print("Shortest Path:", shortest_path)
    print("Shortest Distance:", shortest_distance)
