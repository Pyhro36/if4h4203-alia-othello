:- consult(ia). %% consults also the ihm

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
			ia(X, Y, Player), % ask the AI for a move, that is, an index for the Player 
    	    playMove(X, Y, Player), % Play the move and get the result in a new Board
    	    changePlayer(Player,NextPlayer), % Change the player before next turn
            play(NextPlayer). % next turn!

%%%% Play a Move, add a case in the list of predicates
playMove(X, Y, Player) :- assert(case(X, Y, Player)), reverseGauche(X, Y, Player), reverseBasDroite(X, Y, Player).

%%% reverse a case
reverse(X, Y, Player) :- changePlayer(Player, OtherPlayer), retract(case(X,Y,OtherPlayer)), assert(case(X,Y,Player)).


%%%% reverse all the cases à the left of the played case.
reverseGauche(X, Y, Player) :- contactGauche(X, Y, X2, Y2), case(X2, Y2, Player).
reverseGauche(X, Y, Player) :- contactGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseGauche(X2, Y2, Player), reverse(X2,Y2,Player).

reverseDroite(X, Y, Player) :- contactDroite(X, Y, X2, Y2), case(X2, Y2, Player).
reverseDroite(X, Y, Player) :- contactDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseDroite(X2, Y2, Player), reverse(X2,Y2,Player).

reverseHaut(X, Y, Player) :- contactHaut(X, Y, X2, Y2), case(X2, Y2, Player).
reverseHaut(X, Y, Player) :- contactHaut(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseHaut(X2, Y2, Player), reverse(X2,Y2,Player).

reverseBas(X, Y, Player) :- contactBas(X, Y, X2, Y2), case(X2, Y2, Player).
reverseBas(X, Y, Player) :- contactBas(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseBas(X2, Y2, Player), reverse(X2,Y2,Player).

reverseHautGauche(X, Y, Player) :- contactHautGauche(X, Y, X2, Y2), case(X2, Y2, Player).
reverseHautGauche(X, Y, Player) :- contactHautGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseHautGauche(X2, Y2, Player), reverse(X2,Y2,Player).

reverseBasGauche(X, Y, Player) :- contactBasGauche(X, Y, X2, Y2), case(X2, Y2, Player).
reverseBasGauche(X, Y, Player) :- contactBasGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseBasGauche(X2, Y2, Player), reverse(X2,Y2,Player).

reverseHautDroite(X, Y, Player) :- contactHautDroite(X, Y, X2, Y2), case(X2, Y2, Player).
reverseHautDroite(X, Y, Player) :- contactHautDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseHautDroite(X2, Y2, Player), reverse(X2,Y2,Player).

reverseBasDroite(X, Y, Player) :- contactBasDroite(X, Y, X2, Y2), case(X2, Y2, Player).
reverseBasDroite(X, Y, Player) :- contactBasDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseBasDroite(X2, Y2, Player), reverse(X2,Y2,Player).

init :- play('n').

%%%% Predicate to get the next player
changePlayer('b','n').
changePlayer('n','b').
