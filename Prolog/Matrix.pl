:- include('KB').


canCarry(NX,NY,[[NX,NY]|_],H,H2):-append([[NX,NY]],H,H2).
canCarry(NX,NY,[[_,_]|CT],H,H2):- canCarry(NX,NY,CT,H,H2).

nextState(NX,NY,C,H,s0):- capacity(C),neo_loc(X,Y),NX=X,NY=Y,hostages_loc(H).
nextState(NX,NY,N,H,result(right,S)):-    NY>0, NY2 is NY-1,nextState(NX,NY2,N,H,S) .
nextState(NX,NY,N,H,result(left,S)):-  grid(_,M),NY<(M-1), NY2 is NY+1,nextState(NX,NY2,N,H,S).
nextState(NX,NY,N,H,result(down,S)):-    NX>0, NX2 is NX-1,nextState(NX2,NY,N,H,S) .
nextState(NX,NY,N,H,result(up,S)):-  grid(_,M),NX<(M-1), NX2 is NX+1,nextState(NX2,NY,N,H,S).
nextState(NX,NY,N,H,result(carry,S)):-  N2 is N+1,N>=0,hostages_loc(AH), canCarry(NX,NY,AH,H,H2), nextState(NX,NY,N2,H2,S).
nextState(NX,NY,C,H,result(drop,S)):-  booth(NX,NY),capacity(C),N2 is 0,nextState(NX,NY,N2,H,S).

goal(S):- searchNeo(0,S).
%check on a given solution 
searchNeo(_,S):-
    not(var(S)),
    booth(NX,NY),
    capacity(C),
    nextState(NX,NY,C,[],S).


%D not exceeded, traverse with same limit
searchNeo(D,S):-
    var(S),
    booth(NX,NY),
    capacity(C),
    call_with_depth_limit(nextState(NX,NY,C,[],S),D,L),
    L\=depth_limit_exceeded.

%D is exceeded, traverse with a new limit
searchNeo(D,S):-
    var(S),
    booth(NX,NY),
    capacity(C),
    call_with_depth_limit(nextState(NX,NY,C,[],S),D,L),
    L=depth_limit_exceeded,
     D1 is D+1,
    searchNeo(D1,S).