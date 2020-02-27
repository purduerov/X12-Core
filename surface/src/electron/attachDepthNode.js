const { spawn } = require('child_process');
const JSONStream = require('JSONStream');
const store = require('../store/store.js');
const path = require('path');

module.exports = function attachDepthNode() {
    const sensor = spawn('python3', ['-u', path.resolve(__dirname, '../ros/src/depth_comm/src/depth.py')]);

    sensor.stdout.pipe(JSONStream.parse())
        .on('data', data => {
            store.updateDepthState(data);
        });

    sensor.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });
}
