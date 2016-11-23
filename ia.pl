:- dynamic case/3. % case(Ligne, Colonne, Valeur) avec Ligne et Colonne comprises entre 1 et 8 ; et Valeur est l'un de 'n', 'b', ' '.

:- consult(script).

%% return the X and Y coordinates chosen y the player Player where he want to play.
ia(X, Y, Player) :- randomMove(X, Y, PLayer).

caseLibre(X,Y) :- case(X2,Y2,_), contact(X2,Y2,X,Y), not(case(X,Y,_)), X > 0, X < 9, Y > 0, Y < 9.

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

caseJouable(X,Y,P) :- caseLibre(X,Y), scoreGauche(X,Y,P).
caseJouable(X,Y,P) :- caseLibre(X,Y), scoreDroite(X,Y,P).
caseJouable(X,Y,P) :- caseLibre(X,Y), scoreHaut(X,Y,P).
caseJouable(X,Y,P) :- caseLibre(X,Y), scoreBas(X,Y,P).
caseJouable(X,Y,P) :- caseLibre(X,Y), scoreHautGauche(X,Y,P).
caseJouable(X,Y,P) :- caseLibre(X,Y), scoreBasGauche(X,Y,P).
caseJouable(X,Y,P) :- caseLibre(X,Y), scoreHautDroite(X,Y,P).
caseJouable(X,Y,P) :- caseLibre(X,Y), scoreBasDroite(X,Y,P).

scoreGauche(X,Y,P) :- contactGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsGauche(X2,Y2,P).
pointsGauche(X,Y,P) :- contactGauche(X,Y,X2,Y2), case(X2,Y2,P).
pointsGauche(X,Y,P) :- contactGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsGauche(X2,Y2,P).

scoreDroite(X,Y,P) :- contactDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsDroite(X2,Y2,P).
pointsDroite(X,Y,P) :- contactDroite(X,Y,X2,Y2), case(X2,Y2,P).
pointsDroite(X,Y,P) :- contactDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsDroite(X2,Y2,P).

scoreHaut(X,Y,P) :- contactHaut(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsHaut(X2,Y2,P).
pointsHaut(X,Y,P) :- contactHaut(X,Y,X2,Y2), case(X2,Y2,P).
pointsHaut(X,Y,P) :- contactHaut(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsHaut(X2,Y2,P).

scoreBas(X,Y,P) :- contactBas(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsBas(X2,Y2,P).
pointsBas(X,Y,P) :- contactBas(X,Y,X2,Y2), case(X2,Y2,P).
pointsBas(X,Y,P) :- contactBas(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsBas(X2,Y2,P).

scoreHautGauche(X,Y,P) :- contactHautGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsHautGauche(X2,Y2,P).
pointsHautGauche(X,Y,P) :- contactHautGauche(X,Y,X2,Y2), case(X2,Y2,P).
pointsHautGauche(X,Y,P) :- contactHautGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsHautGauche(X2,Y2,P).

scoreBasGauche(X,Y,P) :- contactBasGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsBasGauche(X2,Y2,P).
pointsBasGauche(X,Y,P) :- contactBasGauche(X,Y,X2,Y2), case(X2,Y2,P).
pointsBasGauche(X,Y,P) :- contactBasGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsBasGauche(X2,Y2,P).

scoreHautDroite(X,Y,P) :- contactHautDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsHautDroite(X2,Y2,P).
pointsHautDroite(X,Y,P) :- contactHautDroite(X,Y,X2,Y2), case(X2,Y2,P).
pointsHautDroite(X,Y,P) :- contactHautDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsHautDroite(X2,Y2,P).

scoreBasDroite(X,Y,P) :- contactBasDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsBasDroite(X2,Y2,P).
pointsBasDroite(X,Y,P) :- contactBasDroite(X,Y,X2,Y2), case(X2,Y2,P).
pointsBasDroite(X,Y,P) :- contactBasDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), pointsBasDroite(X2,Y2,P).

randomMove(X,Y,P) :- findall([X2|Y2], caseJouable(X2,Y2,P), L), length(L,Size), random(0,Size,R), nth0(R,L,[X|Y]).
