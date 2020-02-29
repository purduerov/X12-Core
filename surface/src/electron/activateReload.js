const electronReload = require('electron-reload');

const path = require('path');

function activateReload () {
	electronReload(
		path.join(process.cwd(), './dist' ),
		{
			electron : path.join(process.cwd(), 'node_modules', '.bin', 'electron')
		}
	);
}

module.exports = activateReload;