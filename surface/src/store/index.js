const EventEmitter = require('events');
const _ = require('lodash');

const storeSchema = require('./store-schema.js');
const { STORE_UPDATED } = require('../constants');
const defaults = require('./defaults.json');

class Store extends EventEmitter {
	constructor() {
		super();
		this.data = defaults;

		this.updateGamepad = this.updateGamepad.bind(this);
	}

	updatingStore() {
		this.olddata = _.cloneDeep(this.data);
	}

	async storeUpdated() {
		try {
			const yup = await this.validateStore(this.data);
			if (!yup) throw yup;

			this.emit(STORE_UPDATED, this.data);
			
		} catch (err) {
			console.error(err);
			this.data = _.cloneDeep(this.olddata);
		}			
	}

	validateStore() {
		return storeSchema.validate(this.data);
	}

	updateGamepad(newGamepad) {
		this.updatingStore();

		this.data.gamepad.sampleData = newGamepad.sampleData;

		this.storeUpdated();
	}
}

module.exports = new Store();