const path = require('path');
const combineLoaders = require('webpack-combine-loaders');

const WINDOW_DIR = path.resolve(__dirname, 'src/windows');
const APP_DIR = path.resolve(__dirname, 'src');
const DIST = path.resolve(__dirname, 'dist');

module.exports = {
	entry: {
		build_w1: `${WINDOW_DIR}/Window1/index.js`,
		build_w2: `${WINDOW_DIR}/Window2/index.js`,
	},
	output: {
		path: DIST,
		publicPath: '/dist/',
		filename: '[name].js'
	},
	module: {
		rules: [
			{
				test: /\.(js|jsx)$/,
				include: APP_DIR,
				exclude: /node_modules/,
				use: {
					loader: 'babel-loader'
				}
			},
			{
				test: /\.css$/,
				loader: combineLoaders([
					{ loader: 'style-loader' },
					{loader: 'css-loader' }
				])
			}
		]},
	performance: { hints: false }
};