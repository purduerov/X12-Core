const { spawn } = require('child_process');
const JSONStream = require('JSONStream');
const store = require('../store/store.js');


module.exports = function attachDepthNode() {
    const sensor = spawn('python3', ['-u', 'depth.py']);

    sensor.stdout.pipe(JSONStream.parse())
        .on('data', data => {
            store.updateDepthState(data)
        });

    sensor.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });


}
