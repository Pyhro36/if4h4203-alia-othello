:- use_module(library(plunit)).
:- begin_tests(script).
:- consult(script).
test(contact) :-
		/*case 1,1*/
		contact(1,1,0,1),contact(1,1,2,1),contact(1,1,1,0),contact(1,1,1,2),contact(1,1,0,0),contact(1,1,0,2),contact(1,1,2,0),
		contact(1,1,2,2),
		/*case 1,8*/
		contact(1,8,0,8),contact(1,8,2,8),contact(1,8,1,7),contact(1,8,1,9),contact(1,8,0,7),contact(1,8,0,9),contact(1,8,2,7),
		contact(1,8,2,9),
		/*case 8,1*/
		contact(8,1,7,1),contact(8,1,9,1),contact(8,1,8,0),contact(8,1,8,2),contact(8,1,7,0),contact(8,1,7,2),contact(8,1,9,0),
		contact(8,1,9,2),
		/*case 8,8*/
		contact(8,8,7,8),contact(8,8,9,8),contact(8,8,8,7),contact(8,8,8,9),contact(8,8,7,7),contact(8,8,7,9),contact(8,8,9,7),
		contact(8,8,9,9),
		/*case 4,4*/
		contact(4,4,3,4),contact(4,4,5,4),contact(4,4,4,3),contact(4,4,4,5),contact(4,4,3,3),contact(4,4,3,5),contact(4,4,5,3),contact(4,4,5,5).
		
test(contactGauche):- 
		contactGauche(4,4,X2,4),
		X2 is 4-1,
		X2 =:= 3;
		contactGauche(1,4,X2,4),
		X2 is 1-1,
		X2 =:= 0.
		
/* test(contactGauche, all(X==[1,2,3,4,5,6,7,8]):- 
		contactGauche(X,Y,X2,Y),
		X2 is X-1. */
		
test(contactDroite):-
		contactDroite(4,4,X2,4),
		X2 is 4+1,
		X2 =:= 5;
		contactDroite(8,4,X2,4),
		X2 is 8+1,
		X2 =:= 9.
		
/* test(contactDroite, all(X==[1,2,3,4,5,6,7,8]):-
		contactDroite(X,Y,X2,Y),
		X2 is X+1. */
		
test(contactHaut):-
		contactHaut(4,4,4,Y2),
		Y2 is 4-1,
		Y2 =:= 3;
		contactHaut(4,1,4,Y2),
		Y2 is 1-1,
		Y2 =:= 0.
		
/* test(contactHaut, all(Y==[1,2,3,4,5,6,7,8]):-
		contactHaut(X,Y,X,Y2),
		Y2 is Y-1. */
	
test(contactBas):-
		contactBas(4,4,4,Y2),
		Y2 is 4+1,
		Y2 =:= 5;
		contactBas(4,8,4,Y2),
		Y2 is 8+1,
		Y2 =:= 9.
	
/* test(contactBas, all(Y==[1,2,3,4,5,6,7,8]):-
		contactBas(X,Y,X,Y2),
		Y2 is Y+1. */

test(contactHautGauche):-
		contactHautGauche(4,4,X2,Y2),
		X2 is 4-1, 
		Y2 is 4-1,
		X2 =:= 3,
		Y2 =:= 3;
		contactHautGauche(1,1,X2,Y2),
		X2 is 1-1, 
		Y2 is 1-1,
		X2 =:= 0,
		Y2 =:= 0.
		
/* test(contactHautGauche, all(X==[1,2,3,4,5,6,7,8], all(Y==[1,2,3,4,5,6,7,8]):-
		contactHautGauche(X,Y,X2,Y2),
		X2 is X-1, 
		Y2 is Y-1. */
		
test(contactBasGauche):-
		contactBasGauche(4,4,X2,Y2),
		X2 is 4-1,
		Y2 is 4+1
		X2 =:= 3,
		Y2 =:= 5;
		contactBasGauche(1,1,X2,Y2),
		X2 is 1-1,
		Y2 is 1+1
		X2 =:= 0,
		Y2 =:= 2.
		
/* test(contactBasGauche, all(X==[1,2,3,4,5,6,7,8], all(Y==[1,2,3,4,5,6,7,8]):-
		contactBasGauche(X,Y,X2,Y2),
		X2 is X-1,
		Y2 is Y+1. */
		
test(contactHautDroite):-
		contactHautDroite(4,4,X2,Y2),
		X2 is 4+1, 
		Y2 is 4-1,
		X2 =:= 5,
		Y2 =:= 3;
		contactHautDroite(8,1,X2,Y2),
		X2 is 8+1, 
		Y2 is 1-1,
		X2 =:= 9,
		Y2 =:= 0.
		
/* test(contactHautDroite, all(X==[1,2,3,4,5,6,7,8], all(Y==[1,2,3,4,5,6,7,8]):-
		contactHautDroite(X,Y,X2,Y2),
		X2 is X+1, 
		Y2 is Y-1 */.
		
test(contactBasDroite):-
		contactBasDroite(4,4,X2,Y2),
		X2 is 4+1,
		Y2 is 4+1,
		X2 =:= 5,
		Y2 =:= 5;
		contactBasDroite(8,1,X2,Y2),
		X2 is 8+1,
		Y2 is 1+1,
		X2 =:= 9,
		Y2 =:= 2.
		Y2 =:= 2.
		
/* test(contactBasDroite, all(X==[1,2,3,4,5,6,7,8], all(Y==[1,2,3,4,5,6,7,8]):-
		contactBasDroite(X,Y,X2,Y2),
		X2 is X+1,
		Y2 is Y+1. */
		
test(vide) :-
	vide(1,1);vide(2,1);vide(3,1);vide(4,1);vide(5,1);vide(6,1);vide(7,1);vide(8,1);
	vide(1,2);vide(2,2);vide(3,2);vide(4,2);vide(5,2);vide(6,2);vide(7,2);vide(8,2);
	vide(1,3);vide(2,3);vide(3,3);vide(4,3);vide(5,3);vide(6,3);vide(7,3);vide(8,3);
	vide(1,4);vide(2,4);vide(3,4);vide(4,4);vide(5,4);vide(6,4);vide(7,4);vide(8,4);
	vide(1,5);vide(2,5);vide(3,5);vide(4,5);vide(5,5);vide(6,5);vide(7,5);vide(8,5);
	vide(1,6);vide(2,6);vide(3,6);vide(4,6);vide(5,6);vide(6,6);vide(7,6);vide(8,6);
	vide(1,7);vide(2,7);vide(3,7);vide(4,7);vide(5,7);vide(6,7);vide(7,7);vide(8,7);
	vide(1,8);vide(2,8);vide(3,8);vide(4,8);vide(5,8);vide(6,8);vide(7,8);vide(8,8).

		
:- end_tests(script).
:- show_coverage(run_tests).
