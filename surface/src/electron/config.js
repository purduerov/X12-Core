module.exports = {
	windowHTML: [
		'dist/Window1.html',
		'dist/Window2.html'
	],
	WATCH_MODE: process.env.NODE_ENV === 'WATCH',
	DEV_MODE: this.WATCH_MODE
};