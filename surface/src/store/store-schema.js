const yup = require('yup');

const gamepadSchema = yup.object().shape({
	sampleData: yup.number()
});

const storeSchema = yup.object().shape({
	gamepad: gamepadSchema
});

module.exports = storeSchema;