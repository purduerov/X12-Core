const { BrowserWindow } = require('electron');
const { default: installExtension, REACT_DEVELOPER_TOOLS } = require('electron-devtools-installer');
const contextMenu = require('electron-context-menu');
const electronReload = require('electron-reload');

const path = require('path');

const { windowHTML } = require('./config.js');

const DEV_MODE = process.env.NODE_ENV === 'DEV';

module.exports.createWindow = function (windows, idx) {

	const windowFile = windowHTML[idx];
	windows[idx] = new BrowserWindow({
		width: 1600,
		height: 1200,
		webPreferences:{
			webSecurity: false,
			nodeIntegration: true
		}
	});

	windows[idx].loadFile(windowFile);

	if (DEV_MODE) {
		installExtension(REACT_DEVELOPER_TOOLS);

		contextMenu({
			window: windows[idx],
			showInspectElement: true
		});

		windows[idx].webContents.openDevTools();
	}

		
	windows[idx].on('closed', () => {
		windows[idx] = null;
	});
};

module.exports.activateReload = function () {
	electronReload(
		path.join(__dirname, './dist' ),
		{
			electron : path.join(__dirname, 'node_modules', '.bin', 'electron')
		}
	);
};
