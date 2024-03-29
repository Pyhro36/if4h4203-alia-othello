:- consult(iaScore).
:- consult(iaRandom).
:- consult(iaValueCase). %% consults also the ihm

:- dynamic pass/1.

%% to win, the player has to have more cases of his color than the other. %%
gameover(Winner) :- isBoardFull(WCases, BCases), winner(WCases, BCases, Winner).
gameover(Winner) :- pass(2), onBoard(WCases, BCases), winner(WCases, BCases,Winner).

equality :- isBoardFull(32, 32).
equality :- pass(2), onBoard(WCases, BCases), WCases == BCases.

winner(WCases, BCases, 'b') :- WCases > BCases.
winner(WCases, BCases, 'n') :- BCases > WCases.

%% test if the board is full and WCases are the number of cases for white player and idem BCases for black player %%
isBoardFull(WCases, BCases) :- isBoardFull(1,1, WCases, BCases).
isBoardFull(_, 9, 0, 0).
isBoardFull(X, Y, WCases, BCases) :- X < 8, case(X,Y,'b'), RX is X + 1, isBoardFull(RX, Y, RWCases, BCases), WCases is RWCases + 1.
isBoardFull(X, Y, WCases, BCases) :- X < 8, case(X,Y,'n'), RX is X + 1, isBoardFull(RX, Y, WCases, RBCases), BCases is RBCases + 1.
isBoardFull(X, Y, WCases, BCases) :- X = 8, case(X,Y,'b'), RY is Y + 1, isBoardFull(1, RY, RWCases, BCases), WCases is RWCases + 1.
isBoardFull(X, Y, WCases, BCases) :- X = 8, case(X,Y,'n'), RY is Y + 1, isBoardFull(1, RY, WCases, RBCases), BCases is RBCases + 1.

onBoard(WCases, BCases) :- onBoard(1,1, WCases, BCases).
onBoard(_, 9, 0, 0).
onBoard(X, Y, WCases, BCases) :- X < 8, case(X,Y,'b'), RX is X + 1, onBoard(RX, Y, RWCases, BCases), WCases is RWCases + 1.
onBoard(X, Y, WCases, BCases) :- X < 8, case(X,Y,'n'), RX is X + 1, onBoard(RX, Y, WCases, RBCases), BCases is RBCases + 1.
onBoard(X, Y, WCases, BCases) :- X < 8, vide(X,Y), RX is X + 1, onBoard(RX, Y, WCases, BCases).
onBoard(X, Y, WCases, BCases) :- X = 8, case(X,Y,'b'), RY is Y + 1, onBoard(1, RY, RWCases, BCases), WCases is RWCases + 1.
onBoard(X, Y, WCases, BCases) :- X = 8, case(X,Y,'n'), RY is Y + 1, onBoard(1, RY, WCases, RBCases), BCases is RBCases + 1.
onBoard(X, Y, WCases, BCases) :- X = 8, vide(X,Y), RY is Y + 1, onBoard(1, RY, WCases, BCases).

% The game is over, we use a cut to stop the proof search, and display the winner.
play(_) :- gameover(Winner), !. %% write('Game is Over. Winner: '), writeln(Winner), displayBoard.
play(_) :- equality, !. %% write('Game is Over. EQUALITY'), displayBoard.
% The game is not over, we play the next turn
play(Player) :-  %% write('New turn for:'), writeln(Player),
			ia(X, Y, Player), % ask the AI for a move, that is, an index for the Player 
    	    playMove(X, Y, Player), % Play the move and get the result in a new Board
			retractall(pass(_)),
			assert(pass(0)).
			%% displayBoard, % print it
    	    %% changePlayer(Player,NextPlayer), % Change the player before next turn
            %% play(NextPlayer). % next turn!

play(Player) :-  %% write('New turn for:'), writeln(Player),
			not(ia(X, Y, Player)), % ask the AI for a move, that is, an index for the Player 
			%% displayBoard, % print it
    	    %% changePlayer(Player,NextPlayer), % Change the player before next turn
			pass(Passe),
			Passe1 is Passe + 1,
			retract(pass(Passe)),
			assert(pass(Passe1)).
            %% play(NextPlayer). % next turn!

			
%%%% type of ia who plays
ia(X, Y, 'b') :- iaScore(X, Y, 'b').
ia(X, Y, 'n') :- iaValueCase(X, Y, 'n').

%%%% Play a Move, add a case in the list of predicates
playMove(X, Y, Player) :- assert(case(X, Y, Player)), testReverseGauche(X, Y, Player), testReverseDroite(X, Y, Player), testReverseHaut(X, Y, Player), testReverseBas(X, Y, Player), testReverseHautGauche(X, Y, Player), testReverseHautDroite(X, Y, Player), testReverseBasGauche(X, Y, Player), testReverseBasDroite(X, Y, Player).

%%% reverse a case
reverse(X, Y, Player) :- changePlayer(Player, OtherPlayer), retract(case(X,Y,OtherPlayer)), assert(case(X,Y,Player)).

%%%% test if reverse cases to the left
testReverseGauche(X, Y, Player) :- reverseGauche(X, Y, Player).
testReverseGauche(X, Y, Player) :- notReverseGauche(X, Y ,Player).

%%%% reverse the cases to the left.
reverseGauche(X, Y, Player) :- contactGauche(X, Y, X2, Y2), case(X2, Y2, Player).
reverseGauche(X, Y, Player) :- contactGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseGauche(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the left.
notReverseGauche(X, Y, Player) :- contactGauche(X, Y, X2, Y2), vide(X2, Y2).
notReverseGauche(X, Y, Player) :- contactGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseGauche(X2, Y2, Player).

%%%% test if reverse cases to the right.
testReverseDroite(X, Y, Player) :- reverseDroite(X, Y, Player).
testReverseDroite(X, Y, Player) :- notReverseDroite(X, Y ,Player).

reverseDroite(X, Y, Player) :- contactDroite(X, Y, X2, Y2), case(X2, Y2, Player).
reverseDroite(X, Y, Player) :- contactDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseDroite(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the right
notReverseDroite(X, Y, Player) :- contactDroite(X, Y, X2, Y2), vide(X2, Y2).
notReverseDroite(X, Y, Player) :- contactDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseDroite(X2, Y2, Player).

%%%% test if reverse cases to the up
testReverseHaut(X, Y, Player) :- reverseHaut(X, Y, Player).
testReverseHaut(X, Y, Player) :- notReverseHaut(X, Y ,Player).

%%%% reverse the cases to the up
reverseHaut(X, Y, Player) :- contactHaut(X, Y, X2, Y2), case(X2, Y2, Player).
reverseHaut(X, Y, Player) :- contactHaut(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseHaut(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the up
notReverseHaut(X, Y, Player) :- contactHaut(X, Y, X2, Y2), vide(X2, Y2).
notReverseHaut(X, Y, Player) :- contactHaut(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseHaut(X2, Y2, Player).

%%%% test if reverse cases to the Down
testReverseBas(X, Y, Player) :- reverseBas(X, Y, Player).
testReverseBas(X, Y, Player) :- notReverseBas(X, Y ,Player).

%%%% reverse the cases to the Down
reverseBas(X, Y, Player) :- contactBas(X, Y, X2, Y2), case(X2, Y2, Player).
reverseBas(X, Y, Player) :- contactBas(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseBas(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the Down
notReverseBas(X, Y, Player) :- contactBas(X, Y, X2, Y2), vide(X2, Y2).
notReverseBas(X, Y, Player) :- contactBas(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseBas(X2, Y2, Player).

%%%% test if reverse cases to the Up/Left
testReverseHautGauche(X, Y, Player) :- reverseHautGauche(X, Y, Player).
testReverseHautGauche(X, Y, Player) :- notReverseHautGauche(X, Y ,Player).

%%%% reverse the cases to the Up/Left
reverseHautGauche(X, Y, Player) :- contactHautGauche(X, Y, X2, Y2), case(X2, Y2, Player).
reverseHautGauche(X, Y, Player) :- contactHautGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseHautGauche(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the Up/Left
notReverseHautGauche(X, Y, Player) :- contactHautGauche(X, Y, X2, Y2), vide(X2, Y2).
notReverseHautGauche(X, Y, Player) :- contactHautGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseHautGauche(X2, Y2, Player).

%%%% test if reverse cases to the Down/Left
testReverseBasGauche(X, Y, Player) :- reverseBasGauche(X, Y, Player).
testReverseBasGauche(X, Y, Player) :- notReverseBasGauche(X, Y ,Player).

%%%% reverse the cases to the Down/Left
reverseBasGauche(X, Y, Player) :- contactBasGauche(X, Y, X2, Y2), case(X2, Y2, Player).
reverseBasGauche(X, Y, Player) :- contactBasGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseBasGauche(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the Down/Left
notReverseBasGauche(X, Y, Player) :- contactBasGauche(X, Y, X2, Y2), vide(X2, Y2).
notReverseBasGauche(X, Y, Player) :- contactBasGauche(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseBasGauche(X2, Y2, Player).

%%%% test if reverse cases to the Up/Right
testReverseHautDroite(X, Y, Player) :- reverseHautDroite(X, Y, Player).
testReverseHautDroite(X, Y, Player) :- notReverseHautDroite(X, Y ,Player).

%%%% reverse the cases to the Up/Right
reverseHautDroite(X, Y, Player) :- contactHautDroite(X, Y, X2, Y2), case(X2, Y2, Player).
reverseHautDroite(X, Y, Player) :- contactHautDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseHautDroite(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the Up/Right
notReverseHautDroite(X, Y, Player) :- contactHautDroite(X, Y, X2, Y2), vide(X2, Y2).
notReverseHautDroite(X, Y, Player) :- contactHautDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseHautDroite(X2, Y2, Player).

%%%% test if reverse cases to the Down/Right
testReverseBasDroite(X, Y, Player) :- reverseBasDroite(X, Y, Player).
testReverseBasDroite(X, Y, Player) :- notReverseBasDroite(X, Y ,Player).

%%%% reverse the cases to the Down/Right
reverseBasDroite(X, Y, Player) :- contactBasDroite(X, Y, X2, Y2), case(X2, Y2, Player).
reverseBasDroite(X, Y, Player) :- contactBasDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), reverseBasDroite(X2, Y2, Player), reverse(X2,Y2,Player).

%%%% don't reverse the cases to the Down/Right
notReverseBasDroite(X, Y, Player) :- contactBasDroite(X, Y, X2, Y2), vide(X2, Y2).
notReverseBasDroite(X, Y, Player) :- contactBasDroite(X, Y, X2, Y2), changePlayer(Player, OtherPlayer), case(X2, Y2, OtherPlayer), notReverseBasDroite(X2, Y2, Player).

init :- play('n').

%%%% Predicate to get the next player
changePlayer('b','n').
changePlayer('n','b').
