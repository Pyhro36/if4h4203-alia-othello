function playOne() {
	if (gameover) return;
	var start = 0, stop = 0;
	var r = {};
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "play", false);
	start = (new Date()).getTime();
	xhr.send(null);
	stop = (new Date()).getTime();
	r.responseCode = xhr.status;
	r.time = stop - start;
	if (xhr.status == 200 || xhr.status == 0 || xhr.status == 304) {
		r.success = true;
		switch (xhr.responseText) {
		case "n":
			r.gameover = true;
			r.winner = "n";
			r.draw = false;
			break;
		case "b":
			r.gameover = true;
			r.winner = "b";
			r.draw = false;
			break;
		case "d":
			r.gameover = true;
			r.winner = null;
			r.draw = true;
			break;
		case "p":
		default:
			r.gameover = false;
			r.winner = null;
			r.draw = null;
			break;
		}
	} else {
		r.success = false;
	}
	return r;
}

function countScore() {
	var r = {b: 0, n: 0, success: false, status: -1};
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "getBoard", false);
	xhr.send(null);
	r.status = xhr.status;
	if (xhr.status == 200 || xhr.status == 0 || xhr.status == 304) {
		r.b = (xhr.responseText.split("b").length - 1);
		r.n = (xhr.responseText.split("n").length - 1);
		r.success = true;
	}
	return r;
}

function resetBoard() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "resetboard", false);
	xhr.send(null);
	return {status: xhr.status, success: (xhr.status == 200 || xhr.status == 0 || xhr.status == 304)};
}

function statsMatch() {
	var r = {
		success: true,
		draw: null,
		winner: null,
		failureStatus: -1,
		total: {
			turns: 0,
			time: 0,
			score: 0
		},
		b: {
			turns: 0,
			time: 0,
			score: 0
		},
		n: {
			turns: 0,
			time: 0,
			score: 0
		}
	};
	
	var turn; // More like a temp. var
	var blackPlays = true;
	
	// Reset board
	turn = resetBoard();
	if (!turn.success) {
		r.success = false;
		r.failureStatus = turn.status;
		return r;
	}
	
	// Play the game, one turn at a time
	do {
		turn = playOne();
		
		if (!turn.success) {
			r.success = false;
			r.failureStatus = turn.status;
			break;
		}
		
		if (blackPlays) {
			r.n.turns++;
			r.n.time += turn.time;
			blackPlays = false;
		} else  {
			r.b.turns++;
			r.b.time += turn.time;
			blackPlays = false;
		}
		r.total.turns++;
		r.total.time += turn.time;
		
	} while (!(turn.gameover || turn.success));
	
	r.draw = turn.draw;
	r.winner = turn.winner;
	
	// Get the final score
	turn = countScore();
	if (!turn.success) {
		r.success = false;
		r.failureStatus = turn.status;
		return r;
	}
	r.b.score = turn.b;
	r.n.score = turn.n;
	r.total.score = turn.b + turn.r;
	
	return r;
}

function playNMatches (n) {
	var r = {
		total: {
			matches: 0,
			turns: 0,
			time: 0,
			score: 0
		},
		b: {
			victories: 0,
			turns: 0,
			time: 0,
			score: 0
		},
		n: {
			victories: 0,
			turns: 0,
			time: 0,
			score: 0
		}
	};
	
	var match;
	
	for (var i = 0, i < n; i++) {
		match = statsMatch();
		
		if (!match.success) continue;
		
		r.total.matches++;
		if (match.winner == "n") {
			r.n.victories++;
		} else if (match.winner == "b") {
			r.b.victories++;
		}
		
		r.total.turns += match.total.turns;
		r.n.turns += match.n.turns;
		r.b.turns += match.b.turns;
		
		r.total.time += match.total.time;
		r.n.time += match.n.time;
		r.b.time += match.b.time;
		
		r.total.score += match.total.score;
		r.n.score += match.n.score;
		r.b.score += match.b.score;
	}
	return r;
}