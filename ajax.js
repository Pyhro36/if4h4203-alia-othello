function retrieveBoard() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "getBoard", false);
	xhr.send(null);
	if (!(xhr.status == 200 || xhr.status == 0 || xhr.status == 304)) {
		return;
	}
	return xhr.responseText;
}

function advanceState() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "play", false);
	xhr.send(null);
	if (!(xhr.status == 200 || xhr.status == 0 || xhr.status == 304)) {
		return;
	}
	return xhr.responseText;
}