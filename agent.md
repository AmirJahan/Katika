# Agent Context: Pathfinding Algorithms Visualization

## Project Overview

This is a C++ educational tool that visualizes and compares four pathfinding algorithms (BFS, DFS, Dijkstra, A*) in real-time on a 2D grid. Built with Raylib for graphics rendering.

## Directory Structure

```
/
├── main.cpp                 # Entry point, creates Ai instance
├── Ai.h                     # Main class header, grid constants (10x20, 50px cells)
├── Ai.cpp                   # Window init, rendering, game loop
├── Node.h                   # Node struct (position, costs, parent, state)
├── Ai+BFS.cpp              # Breadth-First Search (queue-based)
├── Ai+DFS.cpp              # Depth-First Search (stack-based)
├── Ai+Dijkstra.cpp         # Dijkstra's Algorithm (priority queue by gCost)
├── Ai+AStar.cpp            # A* Search (priority queue by fCost, Manhattan heuristic)
├── Ai+GetNeighbors.cpp     # Returns valid 4-directional neighbors
├── Ai+GetRandomNode.cpp    # Selects random unblocked node
├── Makefile                # Cross-platform build (macOS/Linux/Windows)
└── README.md               # User documentation
```

## Key Components

### Ai Class (Ai.h, Ai.cpp)
- `grid`: 10x20 2D vector of Nodes
- `startPoint`, `endPoint`: Blue (start) and Green (end) nodes
- `bfsTraced`, `dfsTraced`, `dijkstraTraced`, `aStarTraced`: Algorithm paths with colors
- `Main()`: Initializes 1000x500 window at 60 FPS, runs game loop
- `Start()`: Creates grid nodes
- `Restart()`: Resets grid, adds 10% random obstacles, runs all algorithms
- `UpdateAndDraw()`: Renders grid and paths, handles 'R' key for regeneration

### Node Struct (Node.h)
- Position: `row`, `col`, `position` (Vector2)
- Pathfinding: `gCost`, `hCost`, `fCost`, `parent`
- State: `visited`, `blocked`, `selected`
- Rendering: `fill`, `stroke`, `size`, `step`, `dispText`
- Methods: `Draw()`, `DrawPath()`, `Reset()`

### Algorithm Implementations
| File | Algorithm | Data Structure | Optimal | Heuristic |
|------|-----------|---------------|---------|-----------|
| Ai+BFS.cpp | Breadth-First Search | Queue (FIFO) | Yes (unweighted) | No |
| Ai+DFS.cpp | Depth-First Search | Stack (LIFO) | No | No |
| Ai+Dijkstra.cpp | Dijkstra's | Priority Queue (min gCost) | Yes | No |
| Ai+AStar.cpp | A* Search | Priority Queue (min fCost) | Yes | Manhattan |

## Build & Run

```bash
make        # Compile for current platform
./main      # Run the application
```

Press 'R' to regenerate the maze with new obstacles and start/end points.

## Technologies

- **C++14+**: Primary language
- **Raylib 5.0**: Graphics, window management, input
- **STL**: vector, queue, stack, priority_queue

## Code Patterns

1. **Grid-based pathfinding**: 10x20 nodes, 4-directional movement (N/S/E/W)
2. **Path reconstruction**: Follow `parent` pointers from goal to start
3. **Priority queue comparators**: Lambda functions for min-heap ordering
4. **Bounds checking**: `isWithinGrid()` lambda in GetNeighbors

## Common Modifications

- **Change grid size**: Modify `ROW_COUNT`, `COL_COUNT` in Ai.h
- **Adjust obstacle density**: Change `0.1` in Restart() loop
- **Add diagonal movement**: Extend GetNeighbors to include diagonal neighbors
- **Change heuristics**: Modify hCost calculation in A* for different distance metrics
