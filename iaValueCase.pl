:- consult(iaRandom).
:- ensure_loaded(script).

% Method called for the I.A. based on each case value.

% return the X and Y coordinates chosen by the player Player where he want to play.
iaValueCase(X, Y, Player) :- randomizeValueMove(X,Y,Player).

% Facts for the dictionnary

caseValue(1,1,10000).
caseValue(1,2,-3000).
caseValue(1,3,1000).
caseValue(1,4,800).
caseValue(1,5,800).
caseValue(1,6,1000).
caseValue(1,7,-3000).
caseValue(1,8,-3000).

caseValue(2,1,-3000).
caseValue(2,2,-5000).
caseValue(2,3,-450).
caseValue(2,4,-500).
caseValue(2,5,-500).
caseValue(2,6,-450).
caseValue(2,7,-5000).
caseValue(2,8,-3000).

caseValue(3,1,1000).
caseValue(3,2,-450).
caseValue(3,3,30).
caseValue(3,4,10).
caseValue(3,5,10).
caseValue(3,6,30).
caseValue(3,7,-450).
caseValue(3,8,1000).

caseValue(4,1,800).
caseValue(4,2,-500).
caseValue(4,3,10).
caseValue(4,4,50).
caseValue(4,5,50).
caseValue(4,6,10).
caseValue(4,7,-500).
caseValue(4,8,800).

caseValue(5,1,800).
caseValue(5,2,-500).
caseValue(5,3,10).
caseValue(5,4,50).
caseValue(5,5,50).
caseValue(5,6,10).
caseValue(5,7,-500).
caseValue(5,8,800).

caseValue(6,1,1000).
caseValue(6,2,-450).
caseValue(6,3,30).
caseValue(6,4,10).
caseValue(6,5,10).
caseValue(6,6,30).
caseValue(6,7,-450).
caseValue(6,8,1000).

caseValue(7,1,-3000).
caseValue(7,2,-5000).
caseValue(7,3,-450).
caseValue(7,4,-500).
caseValue(7,5,-500).
caseValue(7,6,-450).
caseValue(7,7,-5000).
caseValue(7,8,-3000).

caseValue(8,1,10000).
caseValue(8,2,-3000).
caseValue(8,3,1000).
caseValue(8,4,800).
caseValue(8,5,800).
caseValue(8,6,1000).
caseValue(8,7,-3000).
caseValue(8,8,10000).

% Check if there is no coins on the selected case
caseLibreVal(X2,Y2) :- case(X,Y,_), contact(X,Y,X2,Y2), not(case(X2,Y2,_)), X2 > 0, X2 < 9, Y2 > 0, Y2 < 9.

% Search the weight of a selected case
scoreDroitePoids(X,Y,P,Poids) :- contactGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X,Y,Poids), pointsGauche(X2,Y2,P).
scoreGauchePoids(X,Y,P,Poids) :- contactDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X,Y,Poids), pointsDroite(X2,Y2,P).
scoreBasPoids(X,Y,P,Poids) :- contactHaut(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X,Y,Poids), pointsHaut(X2,Y2,P).
scoreHautPoids(X,Y,P,Poids) :- contactBas(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X,Y,Poids), pointsBas(X2,Y2,P).
scoreBasDroitePoids(X,Y,P,Poids) :- contactHautGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X,Y,Poids), pointsHautGauche(X2,Y2,P).
scoreHautDroitePoids(X,Y,P,Poids) :- contactBasGauche(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X2,Y,Poids), pointsBasGauche(X2,Y2,P).
scoreBasGauchePoids(X,Y,P,Poids) :- contactHautDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X,Y,Poids), pointsHautDroite(X2,Y2,P).
scoreHautGauchePoids(X,Y,P,Poids) :- contactBasDroite(X,Y,X2,Y2), case(X2,Y2,_), not(case(X2,Y2,P)), caseValue(X,Y,Poids), pointsBasDroite(X2,Y2,P).

caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreGauchePoids(X,Y,P,Poids).
caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreDroitePoids(X,Y,P,Poids).
caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreHautPoids(X,Y,P,Poids).
caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreBasPoids(X,Y,P,Poids).
caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreHautGauchePoids(X,Y,P,Poids).
caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreBasGauchePoids(X,Y,P,Poids).
caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreHautDroitePoids(X,Y,P,Poids).
caseJouablePoids(X,Y,P,Poids) :- caseLibreVal(X,Y), scoreBasDroitePoids(X,Y,P,Poids).

valueMove(X,Y,P) :- findall(S, caseJouablePoids(X2,Y2,P,S), L1), findall([X2,Y2], caseJouablePoids(X2,Y2,P,S), L2), max_member(Max,L1), nth0(Index,L1,Max), nth0(Index,L2,[X|[Y|_]]).
randomizeValueMove(X,Y,P) :- findall([X2|Y2], valueMove(X2,Y2,P), L), length(L,Length), random(0,Length,Rand), nth0(Rand,L,[X|Y]).

% TESTS

:- begin_tests(iaValueCase).

%Tests de cases jouables
test(caseLibreVal, [nondet]) :- caseLibreVal(3,3),
                                caseLibreVal(3,4),
                                caseLibreVal(3,5),
                                caseLibreVal(3,6),
                                caseLibreVal(4,3),
                                caseLibreVal(5,3),
                                caseLibreVal(6,3),
                                caseLibreVal(6,4),
                                caseLibreVal(6,5),
                                caseLibreVal(6,6),
                                caseLibreVal(5,6),
                                caseLibreVal(4,6).

test(caseJouablePoids, [nondet]) :- caseJouablePoids(3,4,n,X), X==10,
                          caseJouablePoids(4,3,n,X), X==10,
                          caseJouablePoids(6,5,n,X), X==10,
                          caseJouablePoids(5,6,n,X), X==10,
                          caseJouablePoids(5,3,b,X), X==10,
                          caseJouablePoids(3,5,b,X), X==10,
                          caseJouablePoids(4,6,b,X), X==10,
                          caseJouablePoids(6,4,b,X), X==10.

test(scoreBasPoids, [nondet]) :-  scoreBasPoids(4,6,b,X), X==10,
                                  scoreBasPoids(5,6,n,X), X==10.

test(scoreHautPoids, [nondet]) :- scoreHautPoids(4,3,n,X), X==10,
                                  scoreHautPoids(5,3,b,X), X==10.

test(scoreGauchePoids, [nondet]) :- scoreGauchePoids(3,4,n,X), X==10,
                                    scoreGauchePoids(3,5,b,X), X==10.

test(scoreDroitePoids, [nondet]) :- scoreDroitePoids(6,4,b,X), X==10,
                                    scoreDroitePoids(6,5,n,X), X==10.


:- end_tests(iaValueCase).
