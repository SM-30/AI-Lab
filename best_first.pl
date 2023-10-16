% Define the graph as facts.
graph("S", [("A", 1), ("B", 4)]).
graph("A", [("B", 2), ("C", 5), ("G", 12)]).
graph("B", [("C", 2)]).
graph("C", [("G", 3)]).

% Define the heuristic cost table as facts.
h_cost("S", 7).
h_cost("A", 6).
h_cost("B", 4).
h_cost("C", 2).
h_cost("G", 0).

% Define the UCS algorithm.
ucs(Start, Goal, Solution) :-
    ucs_helper([[(Start, 0)]], Goal, Solution).

% Base case: Goal state found.
ucs_helper([Path|_], Goal, Path) :-
    Path = [(Goal, _)|_].

% Explore the next node in the queue.
ucs_helper([Path|Queue], Goal, Solution) :-
    Path = [(Node, Cost)|RestPath],
    findall((NextNode, NextCost),
            (graph(Node, NextNeighbors), member((NextNode, NextCost), NextNeighbors)),
            NextNodes),
    update_paths(Path, NextNodes, NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    ucs_helper(UpdatedQueue, Goal, Solution).

% Update paths with new nodes.
update_paths(_, [], []).
update_paths(Path, [(Node, Cost)|RestNodes], [NewPath|RestPaths]) :-
    append(Path, [(Node, Cost)], NewPath),
    update_paths(Path, RestNodes, RestPaths).

% Entry point to start the UCS algorithm.
start_ucs(Start, Goal, Solution) :-
    ucs(Start, Goal, Solution).

% Example usage:
start_ucs("S", "G", Solution),
write("Solution is: "), write(Solution).
