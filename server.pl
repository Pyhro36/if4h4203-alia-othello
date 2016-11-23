%%% Loading modules & files
:- use_module(library(http/thread_httpd)).   % Modules needed
:- use_module(library(http/http_dispatch)).  % for http server

:- ensure_loaded(ihm).

%%% Define HTTP handlers
:- http_handler(root(.), http_reply_file('index.html', [], []), []).
:- http_handler(root('getBoard'), getBoardHttpHandler, []).

%%% The startup predicate
server(Port) :- http_server(http_dispatch, [port(Port)]).

%%% The handler predicates
getBoardHttpHandler(Request) :- format('Content-type: text/plain~n~n'), printBoard.