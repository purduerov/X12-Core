const EventEmitter = require('events');
const _ = require('lodash');

const {
	STORE_UPDATED,
	GAMEPAD_STATE_UPDATED,
	IMU_UPDATED,
	DEPTH_UPDATED
} = require('../constants');
const defaults = require('./store_defaults.json');

class Store extends EventEmitter {
	constructor() {
		super();
		this.data = defaults;

		this.updateGamepadState = this.updateGamepadState.bind(this);
	}

	fireUpdateEvents(subSection) {
		this.emit(STORE_UPDATED, this.data);

		switch (subSection) {
			case GAMEPAD_STATE_UPDATED:
				this.emit(GAMEPAD_STATE_UPDATED, this.data.gamepad.state);
				break;

			case IMU_UPDATED:
				this.emit(IMU_UPDATED, this.data.sensors.imu);
				break;

			case DEPTH_UPDATED:
				this.emit(DEPTH_UPDATED, this.data.sensors.depth);
				break;

			default:
				break;
		}
	}

	updateImuState(newImustate) {
		_.merge(this.data.sensors.imu, newImustate);
		//this.data.sensors.imu = newImustate;
		this.fireUpdateEvents(IMU_UPDATED);
	}

	updateDepthState(newDepthstate) {
		//_.merge(this.data.sensors.depth, newDepthstate);	//doesn't work when updating a single value; only enumerable objects
		//if(newDepthState) {
			this.data.sensors.depth = newDepthstate;	//check isn't necessary; when input is None in python ros doesn't send it!
		//}
		this.fireUpdateEvents(DEPTH_UPDATED);
	}

	updateGamepadState(newGamepadState) {
		_.merge(this.data.gamepad.state, newGamepadState);
		
		this.fireUpdateEvents(GAMEPAD_STATE_UPDATED);
	}
}

module.exports = new Store();