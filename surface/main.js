const { app } = require('electron');
const {
	createWindow,
	activateReload,
	setupGamepad
} = require('./src/electron');
// const runGamepad = require('./src/gamepad/rungamepad.js');
const spawn = require('child_process').spawn;
const JSONStream = require('JSONStream');
const store = require('./src/store/store.js');
const { GAMEPAD_STATE_UPDATED } = require('./src/constants');

const { WATCH_MODE } = require('./src/electron').config;

let windows = [];


app.on('ready', () => {
	createWindow(windows, 0);
	// createWindow(windows, 1);

	// // setupGamepad();
	// runGamepad();
	const gamepad = spawn('python', [ './gamepad_test.py'], {
		stdio: ['pipe', 'pipe', 'pipe']
	});
	
	gamepad.on('exit', (err) => console.log('exit'));
	
	gamepad.stdout.pipe(JSONStream.parse())
		.on('data', data => {
			store.updateGamepadState(data);
			console.log('got data');
		});
	store.on(GAMEPAD_STATE_UPDATED, data => console.log(data));
	
});

app.on('window-all-closed', () => {
	if (process.platform !== 'darwin') {
		app.quit();
	}
});

app.on('activate', () => {
	if (windows[0] === null){
		createWindow(0);
	}
	if (windows[1] === null) {
		createWindow(1);
	}
});

if (WATCH_MODE) {
	activateReload();
}



/*
OUR CODE

░░░░░░░░░░▀▀▀██████▄▄▄░░░░░░░░░░ 
░░░░░░░░░░░░░░░░░▀▀▀████▄░░░░░░░ 
░░░░░░░░░░▄███████▀░░░▀███▄░░░░░ 
░░░░░░░░▄███████▀░░░░░░░▀███▄░░░ 
░░░░░░▄████████░░░░░░░░░░░███▄░░ 
░░░░░██████████▄░░░░░░░░░░░███▌░ 
░░░░░▀█████▀░▀███▄░░░░░░░░░▐███░ 
░░░░░░░▀█▀░░░░░▀███▄░░░░░░░▐███░ 
░░░░░░░░░░░░░░░░░▀███▄░░░░░███▌░ 
░░░░▄██▄░░░░░░░░░░░▀███▄░░▐███░░ 
░░▄██████▄░░░░░░░░░░░▀███▄███░░░ 
░█████▀▀████▄▄░░░░░░░░▄█████░░░░ 
░████▀░░░▀▀█████▄▄▄▄█████████▄░░ 
░░▀▀░░░░░░░░░▀▀██████▀▀░░░▀▀██░░
*/
