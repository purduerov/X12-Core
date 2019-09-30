var gamepad = require('gamepad');
const fs = require('fs');

let rawdata = fs.readFileSync('layout.json');
let map = JSON.parse(rawdata);

let gamepadState = [];

const DEAD_ZONE = 0.11;

// Initialize the library
gamepad.init();

// List the state of all currently attached devices
for (var i = 0, l = gamepad.numDevices(); i < l; i++) {
	console.log(i, gamepad.deviceAtIndex());
}

// Create a game loop and poll for events
setInterval(() => {
	gamepad.processEvents();
	// console.log(gamepadState.length);
}, 50);
// Scan for new gamepads as a slower rate
//setInterval(gamepad.detectDevices, 500);

function compare(a, b) {
	return a.id - b.id;
}
// Listen for move events on all gamepads
gamepad.on('move', function (controller, id, value) {

	if (Math.abs(value) < DEAD_ZONE) {
		value = 0;
	} else {
		value = Math.round(value * 1000) / 1000;
	}

	const existingIdx = gamepadState.findIndex(axis => axis.id === id);

	if (existingIdx > -1) {
		gamepadState[existingIdx].value = value;
		gamepadState.sort(compare);
	} else {
		gamepadState.push({ id, value });
	}
});

// Listen for button up events on all gamepads
gamepad.on('up', function (controller, num) {
	const existingIdx = gamepadState.findIndex(axis => axis.id == num);

	if (existingIdx > -1) {
		gamepadState[existingIdx].value = 0;
		gamepadState.sort(compare);
	} else {
		gamepadState.push({ id: num, value: 0 });
	}
});

// Listen for button down events on all gamepads
gamepad.on('down', function (controller, num) {
	const existingIdx = gamepadState.findIndex(axis => axis.id == num);

	if (existingIdx > -1) {
		gamepadState[existingIdx].value = 1;
		gamepadState.sort(compare);
	} else {
		gamepadState.push({ id: num, value: 1 });
	}
});

