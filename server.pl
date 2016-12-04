%%% Loading modules & files
:- use_module(library(http/thread_httpd)).   % Modules needed
:- use_module(library(http/http_dispatch)).  % for http server
:- use_module(library(http/http_parameters)).
%:- use_module(library(uri)).

:- ensure_loaded(ihm).
:- ensure_loaded(runner).
:- ensure_loaded(script).


%%% The currentPlayer "variable"
:- dynamic currentPlayer/1.
switchPlayer :-
	currentPlayer('n'),
	retractall(currentPlayer(_)),
	assert(currentPlayer('b')).

switchPlayer :-
	currentPlayer('b'),
	retractall(currentPlayer(_)),
	assert(currentPlayer('n')).


%%% Define HTTP handlers
:- http_handler('/', http_reply_file('index.html', []), []).
:- http_handler('/index.html', http_reply_file('index.html', []), []).
:- http_handler('/index.html', http_reply_file('statsmode.html', []), []).
:- http_handler('/othello.css', http_reply_file('othello.css', []), []).
:- http_handler('/init.js', http_reply_file('init.js', []), []).
:- http_handler('/draw.js', http_reply_file('draw.js', []), []).
:- http_handler('/ajax.js', http_reply_file('ajax.js', []), []).
:- http_handler('/stats.js', http_reply_file('stats.js', []), []).
:- http_handler('/getBoard', getBoardHttpHandler, []).
:- http_handler('/play', playHandler, []).
:- http_handler('/playNTimes', playSeveralHandler, []).
:- http_handler('/resetboard', resetBoard, []).

%%% The startup predicates
server(Port) :- http_server(http_dispatch, [port(Port)]).
startServer :- assert(currentPlayer('n')), server(8080).

%%% The handler predicates
getBoardHttpHandler(_Request) :- format('Content-type: text/plain~n~n'), printBoard.

playHandler(_Request) :- % Play once, but there is a winner already
	gameover(X),
	format('Content-type: text/plain~n~n'),
	format(X).

playHandler(_Request) :- % Play once, but it's a draw
	equality,
	format('Content-type: text/plain~n~n'),
	format('d').

playHandler(_Request) :- % Play once and we can play
	currentPlayer(X),
	play(X),
	switchPlayer,
	format('Content-type: text/plain~n~n'),
	printResult.
	
playSeveralHandler(_Request) :- % Play N times, but there is a winner already
	gameover(X),
	format('Content-type: text/plain~n~n'),
	format(X).
	
playSeveralHandler(_Request) :- % Play N times, but it's a draw
	equality,
	format('Content-type: text/plain~n~n'),
	format('d').
	
playSeveralHandler(Request) :- % Play N times and we can play
	http_parameters(Request, [playCount(Count, [integer])]),
	nonvar(Count),
	currentPlayer(X),
	playNTimes(Count),
	format('Content-type: text/plain~n~n'),
	printResult.


%The stop conditions for the N turns loop
playNTimes(0).
playNTimes(_Count) :-
	gameover(X).
playNTimes(_Count) :-
	equality.

% The actual recursion
playNTimes(Count) :-
	NewCount is Count - 1,
	currentPlayer(X),
	play(X),
	switchPlayer,
	playNTimes(NewCount).