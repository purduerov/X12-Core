const gamepad = require('gamepad');
const _ = require('lodash');

const layout = require('./layout.json');

// Range beneath which raw values are excluded to remove
// 	 noise and unintended motions
const DEAD_ZONE = 0.11;

// Decimal Precions of live values
const PRECISION = 3;

// Millisecond interval of gamepad polling
const INTERVAL = 50;

const UP = 0;
const DOWN = 1;

// Set Calibration Mode 
const CALIBRATION = false;

gamepad.init();

let other = {
	'attached': false,
	'lastAction': null,
	'ctInput': false,
	'isBinary': false
}
let gamepadState = _.assign(layout.continuous, layout.binary, other);
gamepadState = _.mapValues(gamepadState, () => 0);

process.send(gamepadState); //send once to see if attached

let calibrationState = {
	binary: [],
	continuous: [],
};

function gamepadUpdated() {
	if (CALIBRATION) {
		console.clear();
		console.log(calibrationState);
	} else {
		process.send(gamepadState);
	}
	
}

function compare(a, b) {
	return a.id - b.id;
}

setInterval(() => gamepad.processEvents(), INTERVAL);

// Scan for new devices, for example a disconnect happened
setInterval(() => {
	gamepad.detectDevices();
	if(gamepad.deviceAtIndex())
		gamepadState['attached'] = true;
	else
		gamepadState['attached'] = false;
	process.send(gamepadState);
}, 1500);


gamepad.on('move', function (controller, id, value) {
	
	let cor = correctRaw(value);
	if(Math.abs(cor) > 0.75){
		gamepadState.isBinary = false;
		gamepadState.ctInput = true;
		gamepadState.lastAction = id;
	} else gamepadState.ctInput = false;

	try {
		const key = _.findKey(layout.continuous, val => val == id);
		gamepadState[key] = cor;	
	} catch(err) {console.error(err);}

	gamepadUpdated();
});


gamepad.on('up', function (controller, id) {
	try {
		const key = _.findKey(layout.binary, val => val == id);
		gamepadState[key] = UP;
		gamepadState.isBinary = false;

		gamepadUpdated();
	
	} catch(err) {console.error(err);}
});

gamepad.on('down', function (controller, id) {

	gamepadState.lastAction = id;
	gamepadState.isBinary = true;

	console.log(id);

	try {
		const key = _.findKey(layout.binary, val => val == id);
		gamepadState[key] = DOWN;
	} catch(err) {console.error(err);}

	gamepadUpdated();
});


function correctRaw(value) {
	// Separate sign from value
	const sign = value < 0 ? -1 : 1;
	value = Math.abs(value);
	

	if (value < DEAD_ZONE) {
		// Exclude dead zone values
		value = 0;
		return value;

	} else {
		// Handle Live values
		value -= DEAD_ZONE;
		value *= 1 / (1 - DEAD_ZONE);
		const mult = Math.pow(10, PRECISION);
		value = Math.round(value * mult) / mult;
		value *= sign;
		return value;
	}
}