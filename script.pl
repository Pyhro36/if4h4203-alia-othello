:- dynamic case/3. % case(Ligne, Colonne, Valeur) avec Ligne et Colonne comprises entre 1 et 8 ; et Valeur est l'un de 'n', 'b', ' '.

:- consult(ihm).

case(1,1,'b').
case(1,2,'n').
case(2,1,'n').
case(2,2,'b').

caseLibre(X2,Y2) :- case(X,Y,_), contact(X,Y,X2,Y2), not(case(X2,Y2,_)), X2 > 0, X2 < 9, Y2 > 0, Y2 < 9.

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