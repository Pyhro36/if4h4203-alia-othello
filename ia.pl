:- dynamic case/3. % case(Ligne, Colonne, Valeur) avec Ligne et Colonne comprises entre 1 et 8 ; et Valeur est l'un de 'n', 'b', ' '.

:- consult(script).

%% return the X and Y coordinates chosen y the player Player where he want to play.
ia(X, Y, Player) :- randomMove(X, Y, PLayer). 
