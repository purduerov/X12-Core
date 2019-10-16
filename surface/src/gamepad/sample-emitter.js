let number = 0;

setInterval(() => {
	process.send({
		sampleData: ++number
	});
}, 200);