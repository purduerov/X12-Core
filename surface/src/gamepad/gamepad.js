const gamepad = require('gamepad');
const _ = require('lodash');
const path = require('path');

const {
	default_binding_name,
	default_state,
	INTERVAL,
	UP,
	DOWN 
} = require('./gamepad_defaults.js');
const { CALIBRATION_MODE } = require('./config.js');
const {
	GAMEPAD_SENDING_DATA,
	GAMEPAD_CONTINUOUS_LAST_ID,
	GAMEPAD_BINARY_LAST_ID
} = require('../constants');

const correctRaw = require('./corret_raw.js');

const binding_file = path.join(__dirname, 'bindings', default_binding_name + '.json');
console.log('Using bindings file: ', path.relative(__dirname, binding_file));

// Load default bindings once, update this variable elsewhere
// if frontend requests bindings change
let bindings = require(binding_file);

gamepad.init();

// Initialize State
let gamepadState = default_state;

setInterval(() => gamepad.processEvents(), INTERVAL);

// Scan for new devices, for example a disconnect happened
setInterval(() => {
	gamepad.detectDevices();

	// TODO use this to change gamepad attached status
}, 1500);

gamepad.on('attach', (id, device) => {
	console.log('attached');
});

if (!CALIBRATION_MODE) {
	gamepad.on('move', function (controller, id, value) {
		try {
			const key = _.findKey(bindings.continuous, joystick => joystick == id);
			gamepadState[key] = correctRaw(value);
	
			gamepadUpdated();
		} catch(err) {
			console.error(err);
		}
	});
	
	
	gamepad.on('up', function (controller, id) {
		try {
			const key = _.findKey(bindings.binary, button => button == id);
			gamepadState[key] = UP;
	
			gamepadUpdated();
		} catch(err) {
			console.error(err);
		}
	});
	
	gamepad.on('down', function (controller, id) {
		try {
			const key = _.findKey(bindings.binary, button => button == id);
			gamepadState[key] = DOWN;
	
			gamepadUpdated();
		} catch(err) {
			console.error(err);
		}
	});

} else { // if Calibration mode is true

	gamepad.on('move', function (controller, id, value) {
		const correctedValue = correctRaw(value);
		if (correctedValue != 0) {
			console.clear();
			console.log(`Last ID (continuous axis): ${id}`);
			// process.send({
			// 	message: GAMEPAD_CONTINUOUS_LAST_ID,
			// 	data: { id, value },
			// });
		}
	});

	gamepad.on('down', function (controller, id) {
		console.clear();
		console.log(`Last ID (binary axis): ${id}`);
		// process.send({
		// 	message: GAMEPAD_BINARY_LAST_ID,
		// 	data: { id }
		// });
	});
}




function gamepadUpdated() {
	process.send({
		message: GAMEPAD_SENDING_DATA,
		data: gamepadState
	});
}