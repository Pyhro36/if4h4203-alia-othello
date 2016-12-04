:- use_module(library(plunit)).
:- begin_tests(runner).
:- consult(runner).

test(winner) :-
		winner(0,64,'n'),
		winner(1,63,'n'),
		winner(2,62,'n'),
		winner(3,61,'n'),
		winner(4,60,'n'),
		winner(5,59,'n'),
		winner(6,58,'n'),
		winner(7,57,'n'),
		winner(8,56,'n'),
		winner(9,55,'n'),
		winner(10,54,'n'),
		winner(11,53,'n'),
		winner(12,52,'n'),
		winner(13,51,'n'),
		winner(14,50,'n'),
		winner(15,49,'n'),
		winner(16,48,'n'),
		winner(17,47,'n'),
		winner(18,46,'n'),
		winner(19,45,'n'),
		winner(20,44,'n'),
		winner(21,43,'n'),
		winner(22,42,'n'),
		winner(23,41,'n'),
		winner(24,40,'n'),
		winner(25,39,'n'),
		winner(26,38,'n'),
		winner(27,37,'n'),
		winner(28,36,'n'),
		winner(29,35,'n'),
		winner(30,34,'n'),
		winner(31,33,'n'),
		winner(64,0,'b'),
		winner(63,1,'b'),
		winner(62,2,'b'),
		winner(61,3,'b'),
		winner(60,4,'b'),
		winner(59,5,'b'),
		winner(58,6,'b'),
		winner(57,7,'b'),
		winner(56,8,'b'),
		winner(55,9,'b'),
		winner(54,10,'b'),
		winner(53,11,'b'),
		winner(52,12,'b'),
		winner(51,13,'b'),
		winner(50,14,'b'),
		winner(49,15,'b'),
		winner(48,16,'b'),
		winner(47,17,'b'),
		winner(46,18,'b'),
		winner(45,19,'b'),
		winner(44,20,'b'),
		winner(43,21,'b'),
		winner(42,22,'b'),
		winner(41,23,'b'),
		winner(40,24,'b'),
		winner(39,25,'b'),
		winner(38,26,'b'),
		winner(37,27,'b'),
		winner(36,28,'b'),
		winner(35,29,'b'),
		winner(34,30,'b'),
		winner(33,31,'b').
		
test(equality) :- 

assert(case(1,1,'b')),
assert(case(2,1,'n')),
assert(case(3,1,'b')),
assert(case(4,1,'n')),
assert(case(5,1,'n')),
assert(case(6,1,'n')),
assert(case(7,1,'n')),
assert(case(8,1,'b')),

assert(case(1,2,'b')),
assert(case(2,2,'n')),
assert(case(3,2,'b')),
assert(case(4,2,'n')),
assert(case(5,2,'n')),
assert(case(6,2,'b')),
assert(case(7,2,'n')),
assert(case(8,2,'b')),

assert(case(1,3,'b')),
assert(case(2,3,'n')),
assert(case(3,3,'b')),
assert(case(4,3,'n')),
assert(case(5,3,'n')),
assert(case(6,3,'b')),
assert(case(7,3,'n')),
assert(case(8,3,'b')),

assert(case(1,4,'b')),
assert(case(2,4,'n')),
assert(case(3,4,'n')),
assert(case(4,4,'b')),
assert(case(5,4,'n')),
assert(case(6,4,'b')),
assert(case(7,4,'n')),
assert(case(8,4,'b')),

assert(case(1,5,'b')),
assert(case(2,5,'n')),
assert(case(3,5,'b')),
assert(case(4,5,'n')),
assert(case(5,5,'b')),
assert(case(6,5,'b')),
assert(case(7,5,'n')),
assert(case(8,5,'b')),

assert(case(1,6,'b')),
assert(case(2,6,'n')),
assert(case(3,6,'b')),
assert(case(4,6,'n')),
assert(case(5,6,'n')),
assert(case(6,6,'b')),
assert(case(7,6,'n')),
assert(case(8,6,'b')),

assert(case(1,7,'b')),
assert(case(2,7,'n')),
assert(case(3,7,'b')),
assert(case(4,7,'n')),
assert(case(5,7,'n')),
assert(case(6,7,'n')),
assert(case(7,7,'n')),
assert(case(8,7,'b')),

assert(case(8,7,'b')),
assert(case(1,8,'b')),
assert(case(2,8,'n')),
assert(case(3,8,'b')),
assert(case(4,8,'n')),
assert(case(5,8,'n')),
assert(case(6,8,'b')),
assert(case(7,8,'b')),
assert(case(8,8,'b')),
equality,
retractall(case(_,_,_)).

test(isBoardFull) :- 

assert(case(1,1,'b')),
assert(case(2,1,'n')),
assert(case(3,1,'b')),
assert(case(4,1,'n')),
assert(case(5,1,'n')),
assert(case(6,1,'n')),
assert(case(7,1,'n')),
assert(case(8,1,'b')),

assert(case(1,2,'b')),
assert(case(2,2,'n')),
assert(case(3,2,'b')),
assert(case(4,2,'n')),
assert(case(5,2,'n')),
assert(case(6,2,'b')),
assert(case(7,2,'n')),
assert(case(8,2,'b')),

assert(case(1,3,'b')),
assert(case(2,3,'n')),
assert(case(3,3,'b')),
assert(case(4,3,'n')),
assert(case(5,3,'n')),
assert(case(6,3,'b')),
assert(case(7,3,'n')),
assert(case(8,3,'b')),

assert(case(1,4,'b')),
assert(case(2,4,'n')),
assert(case(3,4,'n')),
assert(case(4,4,'b')),
assert(case(5,4,'n')),
assert(case(6,4,'b')),
assert(case(7,4,'n')),
assert(case(8,4,'b')),

assert(case(1,5,'b')),
assert(case(2,5,'n')),
assert(case(3,5,'b')),
assert(case(4,5,'n')),
assert(case(5,5,'b')),
assert(case(6,5,'b')),
assert(case(7,5,'n')),
assert(case(8,5,'b')),

assert(case(1,6,'b')),
assert(case(2,6,'n')),
assert(case(3,6,'b')),
assert(case(4,6,'n')),
assert(case(5,6,'n')),
assert(case(6,6,'b')),
assert(case(7,6,'n')),
assert(case(8,6,'b')),

assert(case(1,7,'b')),
assert(case(2,7,'n')),
assert(case(3,7,'b')),
assert(case(4,7,'n')),
assert(case(5,7,'n')),
assert(case(6,7,'n')),
assert(case(7,7,'n')),
assert(case(8,7,'b')),

assert(case(8,7,'b')),
assert(case(1,8,'b')),
assert(case(2,8,'n')),
assert(case(3,8,'b')),
assert(case(4,8,'n')),
assert(case(5,8,'n')),
assert(case(6,8,'b')),
assert(case(7,8,'b')),
assert(case(8,8,'b')),
isBoardFull(32,32).
retractall(case(_,_,_)).
		
:- end_tests(runner).

:-run_tests.

