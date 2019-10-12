const ROSLIB = require('roslib');

const ROS_ADDRESS = 'ws://10.42.0.36:11311';

const ros = new ROSLIB.Ros({
	url: ROS_ADDRESS
});

ros.on('connection', () => {
	console.log(`Connected to ROS at ${ROS_ADDRESS}`);
});

ros.on('error', error => {
	console.log(`Error Connecting to websocket server: ${error}`);
});

ros.on('close', () => {
	console.log('Connection to server closed.');
});

const cmdVel = new ROSLIB.Topic({
	ros : ros,
	name : '',
	messageType : 'geometry_msgs/Twist'
});

const twist = new ROSLIB.Message({
	linear : {
		x : 0.1,
		y : 0.2,
		z : 0.3
	},
	angular : {
		x : -0.1,
		y : -0.2,
		z : -0.3
	}
});


cmdVel.publish(twist);