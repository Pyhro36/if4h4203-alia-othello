:- dynamic case/3. % case(Ligne, Colonne, Valeur) avec Ligne et Colonne comprises entre 1 et 8 ; et Valeur est l'un de 'n', 'b', ' '.

:- consult(ihm).

case(4,4,'b').
case(5,4,'n').
case(4,5,'n').
case(5,5,'b').

contact(X,Y,X2,Y2) :- contactGauche(X,Y,X2,Y2).
contact(X,Y,X2,Y2) :- contactDroite(X,Y,X2,Y2).
contact(X,Y,X2,Y2) :- contactHaut(X,Y,X2,Y2).
contact(X,Y,X2,Y2) :- contactBas(X,Y,X2,Y2).
contact(X,Y,X2,Y2) :- contactHautGauche(X,Y,X2,Y2).
contact(X,Y,X2,Y2) :- contactBasGauche(X,Y,X2,Y2).
contact(X,Y,X2,Y2) :- contactHautDroite(X,Y,X2,Y2).
contact(X,Y,X2,Y2) :- contactBasDroite(X,Y,X2,Y2).

contactGauche(X,Y,X2,Y) :- X2 is X-1.
contactDroite(X,Y,X2,Y) :- X2 is X+1.
contactHaut(X,Y,X,Y2) :- Y2 is Y-1.
contactBas(X,Y,X,Y2) :- Y2 is Y+1.
contactHautGauche(X,Y,X2,Y2) :- X2 is X-1, Y2 is Y-1.
contactBasGauche(X,Y,X2,Y2) :- X2 is X-1, Y2 is Y+1.
contactHautDroite(X,Y,X2,Y2) :- X2 is X+1, Y2 is Y-1.
contactBasDroite(X,Y,X2,Y2) :- X2 is X+1, Y2 is Y+1.

vide(X, Y) :- 