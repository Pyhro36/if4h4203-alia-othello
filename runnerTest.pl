:- use_module(library(plunit)).
:- begin_tests(runner).
:- consult(runner).

test(winner) :-
        winner(33, 31, 'b'),
		winner(31, 32, 'n').

:- end_tests(runner).

