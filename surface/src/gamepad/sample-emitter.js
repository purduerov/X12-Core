const EventEmitter = require('events');

const { SAMPLE_UPDATE } = require('../constants');

class Sample extends EventEmitter {
	constructor() {
		super();

		this.number = 0;

		setInterval(() => {
			this.number++;
			this.update();
		}, 200);

		this.update.bind(this);
	}

	update() {
		this.emit(SAMPLE_UPDATE);
	}
}

module.exports.sample = new Sample();