% find_all_paths(a, g, Result). Command to run code.
% Facts representing edges in the graph
e(a, b).
e(a, c).
e(b, d).
e(b, e).
e(b, f).
e(c, f).
e(c, g).
e(d, h).
e(e, i).
e(e, j).
e(f, k).
e(g, k).

% Solve predicate to find a path from Start to a Goal
solve(Start, Goal, Solution):-
    breadthfirst([[Start]], Goal, Solution).

% Breadth-first search algorithm
breadthfirst([[Node|Path]|_], Goal, [Node|Path]):- Node = Goal.
breadthfirst([Path|Paths], Goal, Solution):-
    extend(Path, NewPaths),
    append(Paths, NewPaths, Paths1),
    breadthfirst(Paths1, Goal, Solution).

% Extend a path by finding neighboring nodes
extend([Node|Path], NewPaths):-
    bagof([NewNode, Node|Path], (e(Node, NewNode), not(member(NewNode, [Node|Path]))), NewPaths).
extend(_, []).

% Append two lists
append([], L, L).
append([X|L1], L2, [X|L3]) :- append(L1, L2, L3).

% Reverse a list
reverse_list(List, Reversed) :-
    reverse(List, Reversed).

% Reverse each path within the list of paths
reverse_paths([], []).
reverse_paths([Path|Paths], [ReversedPath|ReversedPaths]) :-
    reverse_list(Path, ReversedPath),
    reverse_paths(Paths, ReversedPaths).

% Find all paths from Start to Goal
find_all_paths(Start, Goal, Result) :-
    setof(Path, solve(Start, Goal, Path), Paths),
    reverse_paths(Paths, Result).
