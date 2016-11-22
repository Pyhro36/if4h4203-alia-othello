:- dynamic case/3. % case(Ligne, Colonne, Valeur) avec Ligne et Colonne comprises entre 1 et 8 ; et Valeur est l'un de 'n', 'b', ' '.

:- consult(script).

%% return the X and Y coordinates chosen y the player Player where he want to play.
ia(X, Y, Player) :- repeat, X is random(7), Y is random(7), not(caseLibre(X1,Y1)), X1 is X + 1, Y1 is Y + 1, !. 
