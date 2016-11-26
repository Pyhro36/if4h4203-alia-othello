
% Formatted, 'beautiful' display
dspVal(C,L) :- case(C,L,'n'), write('n'). % Black coin
dspVal(C,L) :- case(C,L,'b'), write('b'). % White coin
dspVal(C,L) :- case(C,L,V), V \== 'n', V \== 'b', nonvar(V), write(' '). % Not black nor white: assume empty
dspVal(C,L) :- not(case(C,L,_)), write(' '). % Square does not exist: assume empty

displayBoard :-
    writeln('*------*'),
    dspVal(1,1), dspVal(2,1), dspVal(3,1), dspVal(4,1), dspVal(5,1), dspVal(6,1), dspVal(7,1), dspVal(8,1), writeln(''),
    dspVal(1,2), dspVal(2,2), dspVal(3,2), dspVal(4,2), dspVal(5,2), dspVal(6,2), dspVal(7,2), dspVal(8,2), writeln(''),
    dspVal(1,3), dspVal(2,3), dspVal(3,3), dspVal(4,3), dspVal(5,3), dspVal(6,3), dspVal(7,3), dspVal(8,3), writeln(''),
    dspVal(1,4), dspVal(2,4), dspVal(3,4), dspVal(4,4), dspVal(5,4), dspVal(6,4), dspVal(7,4), dspVal(8,4), writeln(''),
    dspVal(1,5), dspVal(2,5), dspVal(3,5), dspVal(4,5), dspVal(5,5), dspVal(6,5), dspVal(7,5), dspVal(8,5), writeln(''),
    dspVal(1,6), dspVal(2,6), dspVal(3,6), dspVal(4,6), dspVal(5,6), dspVal(6,6), dspVal(7,6), dspVal(8,6), writeln(''),
    dspVal(1,7), dspVal(2,7), dspVal(3,7), dspVal(4,7), dspVal(5,7), dspVal(6,7), dspVal(7,7), dspVal(8,7), writeln(''),
    dspVal(1,8), dspVal(2,8), dspVal(3,8), dspVal(4,8), dspVal(5,8), dspVal(6,8), dspVal(7,8), dspVal(8,8), writeln(''),
    writeln('*------*').


% Unformatted display
printVal(C,L) :- case(C,L,V), nonvar(V), write(V). % Simple output
printVal(C,L) :- not(case(C,L,_)), write('-'). % Square does not exist: assume empty

printBoard :-
    printVal(1,1), printVal(2,1), printVal(3,1), printVal(4,1), printVal(5,1), printVal(6,1), printVal(7,1), printVal(8,1),
    printVal(1,2), printVal(2,2), printVal(3,2), printVal(4,2), printVal(5,2), printVal(6,2), printVal(7,2), printVal(8,2),
    printVal(1,3), printVal(2,3), printVal(3,3), printVal(4,3), printVal(5,3), printVal(6,3), printVal(7,3), printVal(8,3),
    printVal(1,4), printVal(2,4), printVal(3,4), printVal(4,4), printVal(5,4), printVal(6,4), printVal(7,4), printVal(8,4),
    printVal(1,5), printVal(2,5), printVal(3,5), printVal(4,5), printVal(5,5), printVal(6,5), printVal(7,5), printVal(8,5),
    printVal(1,6), printVal(2,6), printVal(3,6), printVal(4,6), printVal(5,6), printVal(6,6), printVal(7,6), printVal(8,6),
    printVal(1,7), printVal(2,7), printVal(3,7), printVal(4,7), printVal(5,7), printVal(6,7), printVal(7,7), printVal(8,7),
    printVal(1,8), printVal(2,8), printVal(3,8), printVal(4,8), printVal(5,8), printVal(6,8), printVal(7,8), printVal(8,8).


% Display 'n' or 'b' if there's a winner, 'd' if it's a draw, or 'p' if we can still play.
printResult :-
	gameover(X),
	write(X).
printResult :-
	equality,
	write('d').
printResult :-
	not(gameover(_)),
	not(equality),
	write('p').