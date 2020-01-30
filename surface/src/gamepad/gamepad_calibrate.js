/*
This file runs the gamepad in calibration mode
*/
const { spawn } = require('child_process');

const {
	GAMEPAD_CONTINUOUS_LAST_ID,
	GAMEPAD_BINARY_LAST_ID,
} = require('../constants');


const gamepad_process = spawn('node', ['src/gamepad/gamepad.js'], {
	stdio: ['ignore', 'pipe', 'ignore', 'ipc']
});

let prevIds = new Array(2);
let prevValue = null;
let lastBinaryID = null;

// Respond to gamepad sending data over IPC
gamepad_process.on('message', ({ message, data }) => {
	switch(message) {
		case GAMEPAD_CONTINUOUS_LAST_ID:
			handleContinuous(data);
			break;
		case GAMEPAD_BINARY_LAST_ID:
			handleBinary(data);
			break;
		default:
			break;
	}
});

function handleContinuous({ id, value }) {
	value = Math.abs(value);

	const printMsg = () => {
		console.clear();
		console.log(`Last ID (continuous axis): ${id}`);
	};

	if (prevIds[0] === id) {
		// do nothing
	} else if (prevIds[1] === id) {
		if (value > prevValue) {
			prevValue = value;
			printMsg();
			prevIds.reverse();
		}
	} else {
		prevIds.push();
		prevIds.unshift(id);
		printMsg();
	}
}

function handleBinary({ id }) {

	const printMsg = () => {
		console.clear();
		console.log(`Last ID (binary axis): ${id}`);
	};

	if (lastBinaryID === id) {
		// do nothing
	} else {
		lastBinaryID = id;
		printMsg();
	}
}