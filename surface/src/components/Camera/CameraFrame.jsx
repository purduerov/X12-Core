import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Col } from 'react-bootstrap';

export default class CameraFrame extends Component {
	render() {
		if (this.props.res === 'high') {
			return (
				<Col>
					<img src={this.props.camera.highres}/>
				</Col>
			);
		} else {
			return (
				<Col onClick={this.props.handleClick(this.props.idx)}>
					<img src={this.props.camera.lowres}/>
				</Col>
			);
		}
	}
}

CameraFrame.propTypes = {
	handleClick: PropTypes.func,
	res: PropTypes.string.isRequired,
	idx: PropTypes.number,
	camera: PropTypes.shape({
		highres: PropTypes.string.isRequired,
		lowres: PropTypes.string.isRequired
	})
};