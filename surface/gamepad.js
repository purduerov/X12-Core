const gamepad = require('./src/electron/gamepad/input.js');

process.on('message', (data) => {
	console.log(data);
	process.send('pong');
});