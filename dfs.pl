% dfs(a, k, Path). Command to run code. Press

% Define the edges in the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(d, h).
edge(d, f).
edge(e, i).
edge(e, j).
edge(f, k).
edge(g, k).

% dfs(Start, Goal, Path)
% Finds a path from Start to Goal using DFS.
dfs(Start, Goal, Path) :-
    dfs_recursive(Start, Goal, [Start], Paths),
    reverse_list(Paths, Path).

% dfs_recursive(CurrentNode, Goal, VisitedNodes, Path)
% Recursive DFS implementation.
dfs_recursive(CurrentNode, Goal, VisitedNodes, [Goal | VisitedNodes]) :-
    edge(CurrentNode, Goal).
dfs_recursive(CurrentNode, Goal, VisitedNodes, Path) :-
    edge(CurrentNode, NextNode),
    not(member(NextNode, VisitedNodes)),
    dfs_recursive(NextNode, Goal, [NextNode | VisitedNodes], Path).

reverse_list(List, Reversed) :-
    reverse(List, Reversed).
