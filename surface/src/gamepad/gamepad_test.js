/*
This file simply runs the gamepad in a separate process
and prints output in order to test gamepad connection and
operation separate from electron
*/

const { spawn } = require('child_process');
const store = require('../store/store.js');

const {
	GAMEPAD_SENDING_DATA,
	GAMEPAD_BINDING_UPDATED,
	GAMEPAD_STATE_UPDATED
} = require('../constants');


const gamepad_process = spawn('node', ['src/gamepad/gamepad.js'], {
	stdio: ['pipe', 'pipe', 'pipe', 'ipc']
});

// Respond to gamepad sending data over IPC
gamepad_process.on('message', message => {
	if (message.message === GAMEPAD_SENDING_DATA) {
		store.updateGamepadState(message.data);
	}
});

store.on(GAMEPAD_BINDING_UPDATED, newBinding => {
	gamepad_process.send({
		message: GAMEPAD_BINDING_UPDATED,
		data: newBinding
	});
});

store.on(GAMEPAD_STATE_UPDATED, state => {
	console.log(state);
});

