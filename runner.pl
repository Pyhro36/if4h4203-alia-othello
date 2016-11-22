:- consult(script). %% consults also the ihm

%% to win, the player has to have more cases of his color than the other. %%
winner('White') :- isBoardFull(WCases, BCases), WCases > BCases.
winner('Black') :- isBoardFull(WCases, BCases), BCases > WCases.
equality :- isBoardFull(32, 32).

%% test if the board is full and WCases are the number of cases for white player and idem BCases for black player %%
isBoardFull(WCases, BCases) :- isBoardFull(1,1, WCases, BCases).
isBoardFull(_, 9, 0, 0).
isBoardFull(X, Y, WCases, BCases) :- X < 8, case(X,Y,'b'), RX is X + 1, isBoardFull(RX, Y, RWCases, BCases), WCases is RWCases + 1.
isBoardFull(X, Y, WCases, BCases) :- X < 8, case(X,Y,'n'), RX is X + 1, isBoardFull(RX, Y, WCases, RBCases), BCases is RBCases + 1.
isBoardFull(X, Y, WCases, BCases) :- X = 8, case(X,Y,'b'), RY is Y + 1, isBoardFull(1, RY, RWCases, BCases), WCases is RWCases + 1.
isBoardFull(X, Y, WCases, BCases) :- X = 8, case(X,Y,'n'), RY is Y + 1, isBoardFull(1, RY, WCases, RBCases), BCases is RBCases + 1.

% The game is over, we use a cut to stop the proof search, and display the winner.
play(_) :- winner(Winner), !, write('Game is Over. Winner: '), writeln(Winner), displayBoard.
play(_) :- equality, !, write('Game is Over. EQUALITY'), displayBoard.
% The game is not over, we play the next turn
play(Player) :-  write('New turn for:'), writeln(Player),
       	    displayBoard, % print it
			ia(Move,Player), % ask the AI for a move, that is, an index for the Player 
    	    %playMove(Board,Move,NewBoard,Player), % Play the move and get the result in a new Board
		    %applyIt(Board, NewBoard), % Remove the old board from the KB and store the new one
    	    %changePlayer(Player,NextPlayer), % Change the player before next turn
            play(NextPlayer). % next turn!

