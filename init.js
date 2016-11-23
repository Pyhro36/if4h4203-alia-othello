function init() {
	var board;
	var row;
	var cell;
	var coin;

	board = document.getElementById("board");
	
	// Fill the column headers
	row = document.createElement("tr");
	row.id = "columnHeaders";
	cell = document.createElement("th");
	cell.className = "cell tHeader";
	row.appendChild(cell);
	
	for (var i = 1; i <= 8; i++) {
		cell = document.createElement("th");
		cell.id = "col" + i.toString();
		cell.className = "cell cHeader";
		cell.appendChild(document.createTextNode(i.toString()));
		row.appendChild(cell);
	}
	
	board.appendChild(row);
	
	// Fill the rows themselves
	for (var i = 1; i <= 8; i++) {
		row = document.createElement("tr");
		cell = document.createElement("th");
		cell.id = "row" + i.toString();
		cell.className = "cell rHeader";
		cell.appendChild(document.createTextNode(i.toString()));
		row.appendChild(cell);
		for (var j = 1; j <= 8; j++) {
			cell = document.createElement("td");
			cell.id = "cell" + j.toString() + i.toString();
			cell.className = "cell playCell";
			coin = document.createElement("canvas");
			coin.id = "coin" + j.toString() + i.toString();
			coin.className = "coin";
			//cell.appendChild(document.createTextNode(j.toString() + i.toString())); // debug
			cell.appendChild(coin);
			row.appendChild(cell);
		}
		board.appendChild(row);
	}
}