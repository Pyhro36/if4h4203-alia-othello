:- consult(script).

%% return the X and Y coordinates chosen y the player Player where he want to play.
iaRandome(X, Y, Player) :- randomMove(X, Y, Player).

caseLibre(X,Y) :- case(X2,Y2,_), contact(X2,Y2,X,Y), not(case(X,Y,_)), X > 0, X < 9, Y > 0, Y < 9.

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

randomMove(X,Y,P) :- findall([X2|Y2], caseJouable(X2,Y2,P), L), length(L,Size), Size > 0, random(0,Size,R), nth0(R,L,[X|Y]).
