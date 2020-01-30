const spawn = require('child_process').spawn;
const JSONStream = require('JSONStream');
const store = require('../store/store.js');

// module.exports = function runGamepad() {
// 	const gamepad = spawn('python', ['-u', './gamepad_test.py'], {
// 		stdio: ['pipe', 'pipe', 'ignore']
// 	});
	
// 	gamepad.stdout.pipe(JSONStream.parse())
// 		.on('data', data => {
// 			store.updateGamepadState(data);
// 			console.log('got data');
// 		});
// };

const gamepad = spawn('python', ['-u', './gamepad_test.py'], {
	stdio: ['pipe', 'pipe', 'pipe']
});

gamepad.stdout.pipe(JSONStream.parse())
	.on('data', data => {
		store.updateGamepadState(data);
		console.log('got data');
	});