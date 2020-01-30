const { gamepad } = require('../store/store_defaults.json');

module.exports = {
	default_binding_name: gamepad.binding,
	default_state: gamepad.state,

	// Range beneath which raw values are excluded to remove
	// 	noise and unintended motions
	DEAD_ZONE: 0.11,

	// Decimal Precions of live values
	PRECISION: 3,

	// Millisecond interval of gamepad polling
	INTERVAL: 50,

	UP: 0,
	DOWN: 1
};
