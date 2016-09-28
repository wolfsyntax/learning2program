% Wolf Syntax (c) 2016
% BSIT-3 S2013-1-1567
% Ateneo de Naga University (S/Y 2016-2017)
% Implemented in PROLOG

% ZEBRA PUZZLE a.k.a. Einstein's Riddle, is a logic puzzle which is to be solved programmatically.

adjacent(_,_,[]).
adjacent(X,Y,L) :- append(_, [X,Y | _], L) ; append(_, [Y,X|_], L).

start(X) :- 
length(X,5),
member([english, red, _, _, _], X),
member([swede, _, _, dog, _], X),
member([dane, _, _, _, tea], X),
adjacent([_, green, _, _, coffee], [_, white, _, _, _], X),
member([_, _, pallmall, birds, _], X),
member([_, yellow, dunhill, _, _], X),
member([_, _, bluemaster, _, beer], X),
member([german, _, prince, _, _], X),

adjacent([_, _, _, cats, _], [_, _, blend, _, _],X),
adjacent([_, _, _, horse, _],[_, _, dunhill, _, _], X),

adjacent([_, blue, _, _, _],[norwegian, _, _, _, _],X),
adjacent([_, _, blend, _, _],[_, _, _, _, water],X),

X = [_, _, [_, _, _, _, milk], _, _],
X = [[norwegian, _, _, _, _], _, _, _, _],

member([_, _, _, zebra, _], X).


%The owner of the zebra is a german in this puzzle.
