const { BrowserWindow } = require('electron');
const { default: installExtension, REACT_DEVELOPER_TOOLS } = require('electron-devtools-installer');
const contextMenu = require('electron-context-menu');

const { DEV_MODE, windowHTML }= require('./config.js');


function createWindow (windows, idx) {

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
}

module.exports = createWindow;