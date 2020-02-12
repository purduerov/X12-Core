const EventEmitter = require('events');

const {
	STORE_UPDATED,
	GAMEPAD_STATE_UPDATED,
	GAMEPAD_BINDING_UPDATED,
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
			
			case GAMEPAD_BINDING_UPDATED:
				this.emit(GAMEPAD_BINDING_UPDATED, this.data.gamepad.binding);
				break;

			case IMU_UPDATED:
				this.emit(IMU_UPDATED, this.data.sensors.imu);
				break;

			default:
				break;
		}
	}

	updateImuState(newImustate) {
		this.data.sensors.imu = newImustate;

		this.fireUpdateEvents(IMU_UPDATED);

	}

	updateGamepadState(newGamepadState) {
		this.data.gamepad.state = newGamepadState;

		this.fireUpdateEvents(GAMEPAD_STATE_UPDATED);
	}

	updateGamepadBinding(newBinding) {
		this.data.gamepad.binding = newBinding;

		this.fireUpdateEvents(GAMEPAD_BINDING_UPDATED);
	}
}

module.exports = new Store();