var gameover = false;

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
	if (gameover) return;
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "play", true);
	//xhr.timeout = 5000;
	xhr.send(null);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0 || xhr.status == 304)) {
			displayBoard();
			var winnerPane = document.getElementById("winner");
			switch (xhr.responseText) {
			case "n":
				winnerPane.innerHTML = "Black Wins!";
				winnerPane.style.display = "block";
				break;
			case "b":
				winnerPane.innerHTML = "White Wins!";
				winnerPane.style.display = "block";
				break;
			case "d":
				winnerPane.innerHTML = "It's a Draw!";
				winnerPane.style.display = "block";
				break;
			case "p":
			default:
				break;
			}
		}
	}
}

function advanceStateNTimes() {
	if (gameover) return;
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "playNTimes?playCount=" + document.getElementById("turnsNumber").value, true);
	//xhr.timeout = 5000;
	xhr.send(null);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0 || xhr.status == 304)) {
			displayBoard();
			var winnerPane = document.getElementById("winner");
			switch (xhr.responseText) {
			case "n":
				winnerPane.innerHTML = "Black Wins!";
				winnerPane.style.display = "block";
				break;
			case "b":
				winnerPane.innerHTML = "White Wins!";
				winnerPane.style.display = "block";
				break;
			case "d":
				winnerPane.innerHTML = "It's a Draw!";
				winnerPane.style.display = "block";
				break;
			case "p":
			default:
				break;
			}
		}
	}
}