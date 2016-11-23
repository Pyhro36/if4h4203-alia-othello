function displayBoard() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "getBoard", true);
	//xhr.timeout = 5000;
	xhr.send(null);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0 || xhr.status == 304)) {
			drawBoard(xhr.responseText);
		}
	}
}

function advanceState() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "play", true);
	//xhr.timeout = 5000;
	xhr.send(null);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0 || xhr.status == 304)) {
			displayBoard();
		}
	}
}

function advanceStateNTimes() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "playNTimes?playCount=" + document.getElementById("turnsNumber").value, true);
	//xhr.timeout = 5000;
	xhr.send(null);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0 || xhr.status == 304)) {
			displayBoard();
		}
	}
}