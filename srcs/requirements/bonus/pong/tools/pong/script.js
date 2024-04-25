function resizePongContainer() {
	var pongContainer = document.getElementById("pongContainer");
	var title = document.getElementById("title");

	console.log(window.innerHeight, title.offsetHeight);
	pongContainer.style.height = (window.innerHeight - title.offsetHeight).toString()  + "px";
}

var inGame = false;
var ballData = {
	direction: [1, 0],
	position: [0, 0],
}

var barPositions = [0, 0]

var keyboard = new Set();

function refreshPositions() {
	var title = document.getElementById("title");
	var ball = document.getElementById("ball");
	ball.style.left = ballData.position[0].toString() + "px";
	ball.style.top = (ballData.position[1]).toString() + "px";
	var barLeft = document.getElementById("barLeft");
	barLeft.style.top = (barPositions[0]).toString() + "px";
	var barRight = document.getElementById("barRight");
	barRight.style.top = (barPositions[1]).toString() + "px";
}

function initGame() {
	var pongContainer = document.getElementById("pongContainer");
	inGame = false;
	ballData.direction[0] = 1;
	ballData.direction[1] = 0;
	ballData.position[0] = pongContainer.offsetWidth / 2;
	ballData.position[1] = pongContainer.offsetHeight / 2;
	barPositions[0] = pongContainer.offsetHeight / 2;
	barPositions[1] = pongContainer.offsetHeight / 2;
	refreshPositions();
	keyboard.clear();
}

async function startGame() {
	const barSpeed = 10 / 924 * window.innerHeight;
	const baseBallSpeed = 2 / 924 * window.innerHeight;
	var interval;
	var title = document.getElementById("title");
	var ball = document.getElementById("ball");
	var barLeft = document.getElementById("barLeft");
	var barRight = document.getElementById("barRight");
	var pongContainer = document.getElementById("pongContainer");
	var ballSpeed = baseBallSpeed * 3;

	interval = setInterval(() => {
		if (!inGame)
		{
			clearInterval(interval);
			initGame();
			return ;
		}

		if (keyboard.has("w"))
			barPositions[0] = Math.max(0, barPositions[0] - barSpeed);
		if (keyboard.has("s"))
			barPositions[0] = Math.min(barPositions[0] + barSpeed, pongContainer.offsetHeight - barLeft.offsetHeight);

		if (keyboard.has("8"))
			barPositions[1] = Math.max(0, barPositions[1] - barSpeed);
		if (keyboard.has("5"))
			barPositions[1] = Math.min(barPositions[1] + barSpeed, pongContainer.offsetHeight - barLeft.offsetHeight);

		ballData.position[0] += ballData.direction[0] * ballSpeed;
		ballData.position[1] += ballData.direction[1] * ballSpeed;
		refreshPositions();

		if (ballData.direction[1] < 0 && ballData.position[1] <= 0)
			ballData.direction[1] = -ballData.direction[1];
		if (ballData.direction[1] > 0 && ballData.position[1] + ball.offsetHeight >= pongContainer.offsetHeight)
			ballData.direction[1] = -ballData.direction[1];

		if (ballData.direction[0] == -1)
		{
			if (ballData.position[0] <= barLeft.offsetWidth
				&& ballData.position[1] <= barPositions[0] + barLeft.offsetHeight
				&& ballData.position[1] + ball.offsetHeight >= barPositions[0])
			{
				ballData.direction[0] = 1;
				ballData.direction[1] = (Math.random() * 2) - 1;
				ballSpeed += baseBallSpeed;
			}
			else if (ballData.position[0] <= 0)
				inGame = false;
		}
		else
		{
			if (ballData.position[0] + ball.offsetWidth >= pongContainer.offsetWidth - barRight.offsetWidth
				&& ballData.position[1] <= barPositions[1] + barRight.offsetHeight
				&& ballData.position[1] + ball.offsetHeight >= barPositions[1])
				{
					ballData.direction[0] = -1;
					ballData.direction[1] = (Math.random() * 2) - 1;
					ballSpeed += baseBallSpeed;
				}
			else if (ballData.position[0] + ball.offsetWidth >= pongContainer.offsetWidth)
				inGame = false;
		}

	}, 1/30*1000);
}

window.addEventListener("keydown", (e) => {
	if (!inGame)
	{
		if (e.key == "Enter")
		{
			inGame = true;
			startGame();
		}
	}
	else
	{
		if (!keyboard.has(e.key))
			keyboard.add(e.key);
	}
})

window.addEventListener("keyup", (e) => {
	if (keyboard.has(e.key))
		keyboard.delete(e.key);
})

window.addEventListener("load", () => {
	resizePongContainer();
	initGame()
});
window.addEventListener("resize", resizePongContainer);