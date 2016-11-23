// if color is not 'b' or 'n', the cell is empty
function drawCell(x, y, color) {
	var canvas = document.getElementById("coin" + x.toString() + y.toString());
	var drawContext = canvas.getContext("2d");
	var radius = (canvas.width + canvas.height) / 4 - 5;
	
	// Choose the color
	if (color == 'n' ) {
		drawContext.fillStyle = "#282828";
		drawContext.strokeStyle = "#000000";
	} else if (color == 'b') {
		drawContext.fillStyle = "#FFFFFF";
		drawContext.strokeStyle = "#D8D8D8";
	} else {
		drawContext.clearRect(0, 0, canvas.width, canvas.height);
		return;
	}
	
	drawContext.lineWidth = 5;
	
	// Draw the coin!
	drawContext.beginPath();
	drawContext.arc(canvas.width / 2, canvas.height / 2, radius, 0, Math.PI*2);
	drawContext.stroke();
	drawContext.closePath();
	drawContext.beginPath();
	drawContext.arc(canvas.width / 2, canvas.height / 2, radius, 0, Math.PI*2);
	drawContext.fill();
	drawContext.closePath();
}

function drawBoard(board) {
	var color;
	var pos;
	for (var x = 1; x <= 8; x++) {
		for (var y = 1; y <= 8; y++) {
			pos = (x-1) + (y-1) * 8;
			color = board.charAt(pos);
			drawCell(x, y, color);
		}
	}
}