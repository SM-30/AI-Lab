% Define the graph using rules for your specific problem.
% The DIRECTED graph is represented as edges between nodes.
% find_path(Start, Goal, MaxDepth, Path) to RUN
% Edges in the graph
edge(a, b).
edge(a, c).
edge(c, f).
edge(c, g).
edge(b, d).
edge(b, c).
edge(c, b).
edge(b, e).
% DLS algorithm with a depth limit using a stack
dls(Start, Goal, MaxDepth, Path) :-
    dls_recursive(Start, Goal, MaxDepth, [Start], Path).

% Recursive DLS predicate
dls_recursive(Goal, Goal, _, Path, Path).
dls_recursive(Current, Goal, DepthLimit, Visited, Path) :-
    DepthLimit > 0,
    edge(Current, Next),
    not(member(Next, Visited)),
    NewDepthLimit is DepthLimit - 1,
    dls_recursive(Next, Goal, NewDepthLimit, [Next|Visited], Path).

% Find a path from Start to Goal with a maximum depth of MaxDepth
find_path(Start, Goal, MaxDepth, Path) :-
    dls(Start, Goal, MaxDepth, Path).

% Example usage:
% find_path(a, d, 3, Path).