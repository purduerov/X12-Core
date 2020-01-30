const { DEAD_ZONE, PRECISION } = require('../constants');

function correctRaw(value) {
	// Separate sign from value
	const sign = value < 0 ? -1 : 1;
	value = Math.abs(value);
	

	if (value < DEAD_ZONE) {
		// Exclude dead zone values
		value = 0;
		return value;

	} else {
		// Handle Live values
		value -= DEAD_ZONE;
		value *= 1 / (1 - DEAD_ZONE);
		const mult = Math.pow(10, PRECISION);
		value = Math.round(value * mult) / mult;
		value *= sign;
		return value;
	}
}

module.exports = correctRaw;