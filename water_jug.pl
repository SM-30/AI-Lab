move((X,Y), (4,Y)) :- X < 4.
move((X,Y), (X,3)) :- Y < 3.
move((X,Y), (X1,Y)) :- X > 0, X1 is 0.
move((X,Y), (X,Y1)) :- Y > 0, Y1 is 0.
move((X,Y), (0,Y)) :- X > 0.
move((X,Y), (X,0)) :- Y > 0.
move((X,Y), (4,Y1)) :- X + Y >= 4, Y > 0, Y1 is Y - (4 - X), Y1 >= 0.
move((X,Y), (X1,Y)) :- X + Y >= 3, X > 0, X1 is X - (3 - Y), X1 >= 0.
move((X,Y), (X1,Y1)) :- X + Y =< 4, Y > 0, X1 is X + Y, Y1 is 0.
move((X,Y), (X1,Y1)) :- X + Y =< 3, X > 0, X1 is 0, Y1 is X + Y.

goal((0,2)).
goal((2,0)).

solve(State, _, [], _) :- goal(State).
solve(State, Visited, [Move|Moves], Depth) :-
    Depth > 0,
    move(State, NextState),
    \+ member(NextState, Visited),
    NewDepth is Depth - 1,
    solve(NextState, [NextState|Visited], Moves, NewDepth),
    Move = NextState.

main(Moves) :-
    InitialState = (0,0),
    MaxDepth = 20,
    solve(InitialState, [InitialState], Moves, MaxDepth).

%main(Moves). to run
