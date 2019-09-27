import React from 'react';
import PropTypes from 'prop-types';

class CameraFrame extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			camera: props.camera || {}
		};
	}

	render() {
		return (
			<div>

			</div>
		);
	}
}

CameraFrame.propTypes = {
	camera: PropTypes.object.isRequired
};

export default CameraFrame;
