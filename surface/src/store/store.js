const EventEmitter = require('events');
const _ = require('lodash');

const {
	STORE_UPDATED,
	GAMEPAD_STATE_UPDATED,
	IMU_UPDATED
} = require('../constants');
const defaults = require('./store_defaults.json');

class Store extends EventEmitter {
	constructor() {
		super();
		this.data = defaults;

		this.updateGamepadState = this.updateGamepadState.bind(this);
		this.updateGamepadBinding = this.updateGamepadBinding.bind(this);
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

			default:
				break;
		}
	}

	updateImuState(newImustate) {
		_.merge(this.data.sensors.imu, newImustate);

		this.fireUpdateEvents(IMU_UPDATED);
	}

	updateGamepadState(newGamepadState) {
		_.merge(this.data.gamepad.state, newGamepadState);

		this.fireUpdateEvents(GAMEPAD_STATE_UPDATED);
	}
}

module.exports = new Store();