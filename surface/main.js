const { ipcMain, app, BrowserWindow } = require('electron');
const contextMenu = require('electron-context-menu');
const { default: installExtension, REACT_DEVELOPER_TOOLS } = require('electron-devtools-installer');

const path = require('path');
const {spawn} = require('child_process');

const { CALIBRATE_CALL, STORE_UPDATED , CALIBRATE_RECEIVE, GAMEPAD_STATE_UPDATED} = require('./src/constants');

const windowFiles = [
	'dist/Window1.html',
	'dist/Window2.html'
];

let windows = [];
let calIdx = 0;
let iterableLayout = [];

function createWindow(idx) {
	const windowFile = windowFiles[idx];
	windows[idx] = new BrowserWindow({
		width: 1600,
		height: 1200,
		icon: path.join(__dirname + 'dist/assets/images/64X64-X11.png'),
		webPreferences:{
			webSecurity: false,
			nodeIntegration: true
		}
	});

	windows[idx].loadFile(windowFile);

	installExtension(REACT_DEVELOPER_TOOLS);

	windows[idx].webContents.openDevTools();
		
	windows[idx].on('closed', () => {
		windows[idx] = null;
	});
}

// Conditionally enable electron-reload capability
if (process.env.NODE_ENV === 'WATCH') {
	require('electron-reload')(
		path.join(__dirname, './dist' ),
		{ electron : path.join(__dirname, 'node_modules', '.bin', 'electron')}
	);
}

// ----------------------------------------------------------------------------------------
// Importing this adds a right-click menu with 'Inspect Element' option [worth it]
contextMenu({
	prepend: (params, browserWindow) => [{
		label: 'Rainbow',
		// Only show it when right-clicking images
		visible: params.mediaType === 'image',
	}],
});
// ----------------------------------------------------------------------------------------

app.on('ready', () => {
	createWindow(0);
	//createWindow(1);

	const store = require('./src/store');



	const sampleEmitter = spawn('node', ['src/gamepad/sample-emitter.js'], {
		stdio: ['ignore', 'ignore', 'ignore', 'ipc']
	});

	sampleEmitter.on('message', data => {
		store.updateGamepad(data);

	});

	store.on(STORE_UPDATED, newStore => {
		windows[0].webContents.send(STORE_UPDATED, newStore);
	});

	store.on(GAMEPAD_STATE_UPDATED, newStore => {
		windows[0].webContents.send(GAMEPAD_STATE_UPDATED, newStore);
		if(newStore.gamepad.calibrating){
			
		}
	});

	const gamepad = spawn('node', ['src/gamepad/index.js'], {
		stdio: ['ignore', 'pipe', 'ignore', 'ipc']
	});
	
	gamepad.stdout.on('data', (data) => {
		//windows[0].webContents.send(CALIBRATE_RECEIVE, `${data}`);
		console.log(`${data}`);
	});
	
	gamepad.on('message', (data) => {
		console.log(`${data}`);
		store.updateGamepadState(data);
	});

	ipcMain.on(CALIBRATE_CALL, (event, args) =>{
		// Do concurrent stuff here
		event.sender.send(CALIBRATE_RECEIVE, 'Calibrating controller...');
		store.data.gamepad.calibrating = true;
		calIdx = 0;
		console.log('state' + JSON.stringify(store.data.gamepad));
		if(store.data.gamepad.state.attached){
			iterableLayout = Object.keys(store.data.gamepad).map(function(key) {
				return (String(key), obj[key]);
			});
		}		
		console.log(iterableLayout);
	});
});

app.on('window-all-closed', () => {
	// On macOS it is common for applications and their menu bar
	// to stay active until the user quits explicitly with Cmd + Q
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
