const spawn = require('child_process').spawn;
const JSONStream = require('JSONStream');

const gamepad = spawn('python', ['-u', './gamepad_test.py'], {
	stdio: ['ignore', 'pipe', 'ignore']
});

gamepad.stdout.pipe(JSONStream.parse()).on('data', data => console.log(data));