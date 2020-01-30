const { spawn } = require('child_process');
const store = require('./src/store/store.js');
const { GAMEPAD_BINDING_UPDATED, GAMEPAD_SENDING_DATA } = require('../constants');

module.exports = function setupGamepad() {
	const gamepad_process = spawn('node', ['src/gamepad/gamepad.js'], {
		stdio: ['ignore', 'pipe', 'ignore', 'ipc']
	});


	// Respond to gamepad sending data over IPC
	gamepad_process.on('message', message => {
		console.log('message');
		if (message.message === GAMEPAD_SENDING_DATA) {
			store.updateGamepadState(message.data);
		}
	});
	
	// Respond to request for bindings change
	store.on(GAMEPAD_BINDING_UPDATED, newBinding => {
		gamepad_process.send({
			message: GAMEPAD_BINDING_UPDATED,
			data: newBinding
		});
	});
};