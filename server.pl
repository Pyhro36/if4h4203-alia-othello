%%% Loading modules & files
:- use_module(library(http/thread_httpd)).   % Modules needed
:- use_module(library(http/http_dispatch)).  % for http server
:- use_module(library(http/http_parameters)).
%:- use_module(library(uri)).

:- ensure_loaded(ihm).
:- ensure_loaded(runner).


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
:- http_handler('/othello.css', http_reply_file('othello.css', []), []).
:- http_handler('/init.js', http_reply_file('init.js', []), []).
:- http_handler('/draw.js', http_reply_file('draw.js', []), []).
:- http_handler('/ajax.js', http_reply_file('ajax.js', []), []).
:- http_handler('/getBoard', getBoardHttpHandler, []).
:- http_handler('/play', playHandler, []).
:- http_handler('/playNTimes', playSeveralHandler, []).

%%% The startup predicates
server(Port) :- http_server(http_dispatch, [port(Port)]).
startServer :- assert(currentPlayer('n')), server(8080).

%%% The handler predicates
getBoardHttpHandler(_Request) :- format('Content-type: text/plain~n~n'), printBoard.

playHandler(_Request) :-
	gameover(X),
	format('Content-type: text/plain~n~n'),
	format(X).

playHandler(_Request) :-
	equality,
	format('Content-type: text/plain~n~n'),
	format('d').

playHandler(_Request) :-
	currentPlayer(X),
	play(X),
	switchPlayer,
	format('Content-type: text/plain~n~n'),
	format('p').
	
playSeveralHandler(Request) :-
	http_parameters(Request, [playCount(Count, [integer])]),
	nonvar(Count),
	currentPlayer(X),
	playNTimes(Count),
	format('Content-type: text/plain~n~n').

playNTimes(0).
playNTimes(Count) :-
	NewCount is Count - 1,
	currentPlayer(X),
	play(X),
	switchPlayer,
	playNTimes(NewCount).