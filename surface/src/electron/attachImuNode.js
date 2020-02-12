const { spawn } = require('child_process');
const JSONStream = require('JSONStream');
const store = require('../store/store.js');


module.exports = function attachImuNode() {
    const sensor = spawn('python3', ['-u', 'Imu.py']);

    sensor.stdout.pipe(JSONStream.parse())
        .on('data', data => {
            store.updateImuState(data)
        });

    sensor.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });


}
