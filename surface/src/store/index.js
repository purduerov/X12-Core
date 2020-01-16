const EventEmitter = require('events');

const { STORE_UPDATED, GAMEPAD_UPDATED } = require('../constants');
const defaults = require('./defaults.json');

class Store extends EventEmitter {
	constructor() {
		super();
		this.data = defaults;

		this.updateGamepad = this.updateGamepad.bind(this);
	}

	fireUpdateEvents(subSection) {
		this.emit(STORE_UPDATED, this.data);

		switch (subSection) {
			case GAMEPAD_UPDATED:
				this.emit(GAMEPAD_UPDATED, this.data.gamepad);
				break;
			default:
				break;
		}
	}

	updateGamepadState(newGamepadState) {
		this.data.gamepad.state = newGamepadState;

		this.fireUpdateEvents(GAMEPAD_UPDATED);
	}
}

module.exports = new Store();