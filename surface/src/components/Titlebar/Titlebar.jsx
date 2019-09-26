import React from 'react';
import Timer from '../Timer/Timer.jsx';
import PropTypes from 'prop-types';
import './titlebar.css';
import {Row, Col } from 'react-bootstrap';

class Titlebar extends React.Component {
	constructor(props) {
		super(props);
		this.state = { text: props.title || 'Purdue ROV 2019' };
	}

	render() {
		return (
			<Row className='title'>
				<Col className='col-align'>
					Purdue ROV Main Screen
				</Col>

				<Col>
					<Timer></Timer>
				</Col>
			</Row>
		);
	}
}

Titlebar.propTypes = {
	title: PropTypes.string.isRequired
};

export default Titlebar;
