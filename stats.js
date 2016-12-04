var sysDate = new Date();

function playOne() {
	if (gameover) return;
	var start =0, stop = 0;
	var r = {};
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "play", false);
	start = sysDate.getTime();
	xhr.send(null);
	stop = sysDate.getTime();
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

function statsMatch() {
	var r = {
		success: false,
		draw: null,
		winner: null,
		failureStatus: -1,
		total: {
			turns: 0,
			time: 0
		},
		b: {
			turns: 0,
			time: 0,
			score: 
		},
		n: {
			turns: 0,
			time: 0,
			score: 0
		}
	};
	
	// TODO
	
	return r;
}