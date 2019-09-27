const { app, BrowserWindow } = require('electron');

const path = require('path');
const url = require('url');

const windowDefinitionFiles = [
	path.resolve(__dirname, 'dist/Window1.html'),
	path.resolve(__dirname, 'dist/Window2.html')
];

function createWindows () {
	windowDefinitionFiles.forEach(windowFile => {
		
		let window = new BrowserWindow({ width: 1600, height: 1200, webPreferences: { webSecurity: false } });

		window.loadFile(url.format({
			pathname: windowFile,
			protocol: 'file:'
		}));
		
		window.on('closed', () => {
			window = null;
		});

	});
}

app.on('window-all-closed', () => {
	// On macOS it is common for applications and their menu bar
	// to stay active until the user quits explicitly with Cmd + Q
	if (process.platform !== 'darwin') {
		app.quit();
	}
});

app.on('activate', () => {
	// On macOS it's common to re-create a window in the app when the
	// dock icon is clicked and there are no other windows open.
	createWindows();
});
