const {ipcRenderer} = window.require('electron');

module.exports = (where) => {
	ipcRenderer.on('buddy-controls-to-win-1', (event, data) => {
        where.setState({
            directions: data,
        });
    });
}