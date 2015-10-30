change(near,far).
change(far,near).
isNear(near,far,X) :-
  X = 1.
isNear(far,near,X) :-
  X = -1.

valid([M,C,_]) :-
  M >= 0,
  C >= 0,
  M < 4,
  C < 4.

safe([M,_,_]) :-
  M == 0.
safe([M,C,_]) :-
  M == C.
safe([M,C,_]) :-
  M >= C,
  M == 3.

move([M1,C1,L1],onemissionary,[M2,C2,L2]) :-
  change(L1,L2),
  isNear(L1,L2,X),
  C1 = C2,
  M1 - M2 =:= X.

move([M1,C1,L1],twomissionaries,[M2,C2,L2]) :-
  change(L1,L2),
  isNear(L1,L2,X),
  C1 = C2,
  M1 - M2 =:= 2 * X.

move([M1,C1,L1],onecannibal,[M2,C2,L2]) :-
  change(L1,L2),
  isNear(L1,L2,X),
  M1 = M2,
  C1 - C2 =:= X.

move([M1,C1,L1],twocannibals,[M2,C2,L2]) :-
  change(L1,L2),
  isNear(L1,L2,X),
  M1 = M2,
  C1 - C2 =:= 2 * X.

move([M1,C1,L1],oneofeach,[M2,C2,L2]) :-
  change(L1,L2),
  isNear(L1,L2,X),
  C1 - C2 =:= X,
  M1 - M2 =:= X.

solution([0,0,_],[]).
solution(Config,[Move|Rest]) :-
  move(Config,Move,NextConfig),
  safe(NextConfig),
  valid(NextConfig),
  solution(NextConfig,Rest).

