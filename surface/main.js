const { ipcMain, app, BrowserWindow } = require('electron');
const path = require('path');
const { spawn } = require('child_process');

const { CALIBRATE_CALL, STORE_UPDATED } = require('./src/constants');

if (process.env.NODE_ENV === 'WATCH') {
	require('electron-reload')(
		path.join(__dirname, './dist' ),
		{ electron : path.join(__dirname, 'node_modules', '.bin', 'electron')}
	);
}

const windowFiles = [
	'dist/Window1.html',
	'dist/Window2.html'
];

let windows = [];

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
	const { default: installExtension, REACT_DEVELOPER_TOOLS } = require('electron-devtools-installer');

	installExtension(REACT_DEVELOPER_TOOLS);

	windows[idx].webContents.openDevTools();
		
	windows[idx].on('closed', () => {
		windows[idx] = null;
	});
}

app.on('ready', () => {
	createWindow(0);
	//createWindow(1);
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

ipcMain.on(CALIBRATE_CALL, (event, args) =>{
	// Do concurrent stuff here
	console.log(CALIBRATE_CALL);
});

const gamepad = spawn('node', ['src/gamepad/input.js'], {
	stdio: ['ignore', 'ignore', 'ignore', 'ipc']
});

gamepad.on('message', data => {
	console.clear();
	console.log(data);
});

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