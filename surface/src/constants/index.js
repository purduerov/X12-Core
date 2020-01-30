module.exports = {
	
	// Event seleased when any change is made to the store
	// Listeners receive entire contents of store
	STORE_UPDATED: 'STORE_UPDATED',

	// Event released when gamepad state is updated in the store
	// Listeners receive gamepad state object only
	GAMEPAD_STATE_UPDATED: 'GAMEPAD_STATE_UPDATED',

	GAMEPAD_BINDING_UPDATED: 'GAMEPAD_BINDING_UPDATED',
	GAMEPAD_SENDING_DATA: 'GAMEPAD_SENDING_DATA',
	GAMEPAD_CONTINUOUS_LAST_ID: 'GAMEPAD_CONTINUOUS_LAST_ID',
	GAMEPAD_BINARY_LAST_ID: 'GAMEPAD_BINARY_LAST_ID',

	CALIBRATE_CALL: 'CALIBRATE_CALL',
	CALIBRATE_RECEIVE: 'CALIBRATE_RECEIVE',
	SAMPLE_UPDATE: 'SAMPLE_UPDATE'
};