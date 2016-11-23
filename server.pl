%%% Loading modules & files
:- use_module(library(http/thread_httpd)).   % Modules needed
:- use_module(library(http/http_dispatch)).  % for http server

:- ensure_loaded(ihm).
:- ensure_loaded(runner).

:- dynamic currentPlayer/1.

%%% Define HTTP handlers
:- http_handler('/', http_reply_file('index.html', []), []).
:- http_handler('/index.html', http_reply_file('index.html', []), []).
:- http_handler('/othello.css', http_reply_file('othello.css', []), []).
:- http_handler('/init.js', http_reply_file('init.js', []), []).
:- http_handler('/draw.js', http_reply_file('draw.js', []), []).
:- http_handler('/ajax.js', http_reply_file('ajax.js', []), []).
:- http_handler('/getBoard', getBoardHttpHandler, []).
%:- http_handler(root('play'), playHandler, []).

%%% The startup predicates
server(Port) :- http_server(http_dispatch, [port(Port)]).
%startServer :- assert(currentPlayer('n')), play('n'), server(8080);

%%% The handler predicates
getBoardHttpHandler(_Request) :- format('Content-type: text/plain~n~n'), printBoard.
