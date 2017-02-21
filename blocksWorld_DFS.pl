%Definition of DFS interface
solve_depthfirst(Node, Path):-
    depthfirst([Node],Node,RevPath),
    reverse(RevPath, Path).

%The actual algorithm (this remains the same
%no matter the problem. In a different problem,
%you only need to define your goal and move predicates to suit the problem).
depthfirst(Visited, Node, Visited):- goal(Node).
depthfirst(Visited, Node, Path):-
    move_cyclefree(Visited, Node, NextNode),
    depthfirst([NextNode|Visited],NextNode,Path).

%Goal and move definition for this specific problem
goal(Stacks):-member([a,b,c], Stacks).
move_cyclefree(Visited, Node, NextNode):-
    move(Node, NextNode),
    \+ member(NextNode, Visited).
move(Stacks, NewStacks):-
    select([Top|Stack1],Stacks, Rest),
    select(Stack2, Rest, OtherStacks),
    NewStacks = [Stack1, [Top|Stack2]|OtherStacks].

%Query = solve_depthfirst([[c,a],[b],[]], Plan).
