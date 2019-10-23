const gamepad = require('gamepad');
const _ = require('lodash');

const layout = require('./layout.js');

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

let other = {
	'calibration': false
}
let gamepadState = _.assign(layout.continuous, layout.binary, other);
gamepadState = _.mapValues(gamepadState, () => 0);

console.log(gamepadState);

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

gamepad.init();

setInterval(() => gamepad.processEvents(), INTERVAL);

// Scan for new devices, for example a disconnect happened
setInterval(() => gamepad.detectDevices(), 1500);


gamepad.on('move', function (controller, id, value) {
	if (CALIBRATION) {
		const existingIdx = calibrationState.continuous.findIndex(axis => axis.id === id);
		if (existingIdx > -1) {
			calibrationState.continuous[existingIdx].value = value;
		} else {
			calibrationState.continuous.push({ id, value });
			calibrationState.continuous.sort(compare);
		}
		gamepadUpdated();

	} else {
		try {
			const key = _.findKey(layout.continuous, val => val == id);
			gamepadState[key] = correctRaw(value);
		
			gamepadUpdated();
			
		} catch(err) {
			console.error(err);
		}
	}

});


gamepad.on('up', function (controller, id) {
	if (CALIBRATION) {
		const existingIdx = calibrationState.binary.findIndex(axis => axis.id === id);
		if (existingIdx > -1) {
			calibrationState.binary[existingIdx].value = UP;
		} else {
			calibrationState.binary.push({ id, value: UP });
			calibrationState.binary.sort(compare);
		}
		gamepadUpdated();

	} else {
		try {
			const key = _.findKey(layout.binary, val => val == id);
			gamepadState[key] = UP;
	
			gamepadUpdated();
		
		} catch(err) {
			console.error(err);
		}
	}
});

gamepad.on('down', function (controller, id) {
	if (CALIBRATION) {
		const existingIdx = calibrationState.binary.findIndex(axis => axis.id === id);
		if (existingIdx > -1) {
			calibrationState.binary[existingIdx].value = DOWN;
		} else {
			calibrationState.binary.push({ id, value: DOWN });
			calibrationState.binary.sort(compare);
		}
		gamepadUpdated();

	} else {
		try {
			const key = _.findKey(layout.binary, val => val == id);
			gamepadState[key] = DOWN;
	
			gamepadUpdated();
		
		} catch(err) {
			console.error(err);
		}
	}
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