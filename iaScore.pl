:- consult(script).

%% return the X and Y coordinates chosen y the player Player where he want to play.
iaScore(X, Y, Player) :- randomizeScoreMove(X, Y, Player).

caseLibre(X2,Y2) :- case(X,Y,_), contact(X,Y,X2,Y2), not(case(X2,Y2,_)), X2 > 0, X2 < 9, Y2 > 0, Y2 < 9.

caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreGaucheScore(X,Y,P,S).
caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreDroiteScore(X,Y,P,S).
caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreHautScore(X,Y,P,S).
caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreBasScore(X,Y,P,S).
caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreHautGaucheScore(X,Y,P,S).
caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreBasGaucheScore(X,Y,P,S).
caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreHautDroiteScore(X,Y,P,S).
caseJouableScore(X,Y,P,S) :- caseLibre(X,Y), scoreBasDroiteScore(X,Y,P,S).

scoreGaucheScore(X,Y,P,S) :- contactGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsGaucheScore(X2,Y2,P,S,Score).
pointsGaucheScore(X,Y,P,S,Score) :- contactGauche(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsGaucheScore(X,Y,P,S,Score) :- contactGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score+1, pointsGaucheScore(X2,Y2,P,S,Score2).

scoreDroiteScore(X,Y,P,S) :- contactDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsDroiteScore(X2,Y2,P,S,Score).
pointsDroiteScore(X,Y,P,S,Score) :- contactDroite(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsDroiteScore(X,Y,P,S,Score) :- contactDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score+1, pointsDroiteScore(X2,Y2,P,S,Score2).

scoreHautScore(X,Y,P,S) :- contactHaut(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsHautScore(X2,Y2,P,S,Score).
pointsHautScore(X,Y,P,S,Score) :- contactHaut(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsHautScore(X,Y,P,S,Score) :- contactHaut(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score+1, pointsHautScore(X2,Y2,P,S,Score2).

scoreBasScore(X,Y,P,S) :- contactBas(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsBasScore(X2,Y2,P,S,Score).
pointsBasScore(X,Y,P,S,Score) :- contactBas(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsBasScore(X,Y,P,S,Score) :- contactBas(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score+1, pointsBasScore(X2,Y2,P,S,Score2).

scoreHautGaucheScore(X,Y,P,S) :- contactHautGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsHautGaucheScore(X2,Y2,P,S,Score).
pointsHautGaucheScore(X,Y,P,S,Score) :- contactHautGauche(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsHautGaucheScore(X,Y,P,S,Score) :- contactHautGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score+1, pointsHautGaucheScore(X2,Y2,P,S,Score2).

scoreBasGaucheScore(X,Y,P,S) :- contactBasGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsBasGaucheScore(X2,Y2,P,S,Score).
pointsBasGaucheScore(X,Y,P,S,Score) :- contactBasGauche(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsBasGaucheScore(X,Y,P,S,Score) :- contactBasGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score, pointsBasGaucheScore(X2,Y2,P,S,Score2).

scoreHautDroiteScore(X,Y,P,S) :- contactHautDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsHautDroiteScore(X2,Y2,P,S,Score).
pointsHautDroiteScore(X,Y,P,S,Score) :- contactHautDroite(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsHautDroiteScore(X,Y,P,S,Score) :- contactHautDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score+1, pointsHautDroiteScore(X2,Y2,P,S,Score2).

scoreBasDroiteScore(X,Y,P,S) :- contactBasDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score is 1, pointsBasDroiteScore(X2,Y2,P,S,Score).
pointsBasDroiteScore(X,Y,P,S,Score) :- contactBasDroite(X,Y,X2,Y2), case(X2,Y2,P), S is Score.
pointsBasDroiteScore(X,Y,P,S,Score) :- contactBasDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), Score2 is Score+1, pointsBasDroiteScore(X2,Y2,P,S,Score2).

randomizeScoreMove(X,Y,P) :- findall([X2|Y2], scoreMove(X2,Y2,P), L), length(L,Length), Length > 0, random(0,Length,Rand), nth0(Rand,L,[X|Y]).
scoreMove(X,Y,P) :- findall(S, caseJouableScore(X2,Y2,P,S), L1), findall([X2,Y2], caseJouableScore(X2,Y2,P,S), L2), max_member(Max,L1), nth0(Index,L1,Max), nth0(Index,L2,[X|[Y|_]]).